# Add player sprite

This chapter shows how to add a player sprite to a game,
at a certain position and of a certain size.

Bevy supports 2D, isometric ('2.5D') and 3D.
For simplicity, the game we develop is 2D.

In this chapter, there are many good ways to the code.
I picked the route that has no rewrites of old code in it,
as this would best fit a book.

This chapter introduces:

- closures
- Bevy bundles
- a Bevy `Transform`
- an in-function assertion

## First test: our `App` needs a position and size

If we want to add a player sprite to the game
at a certain position and of a certain size,
our `App` needs to know.

Our first test forces us to supply this information in the `create_app`
function:

```rust
fn test_can_create_app() {
    let initial_player_position = Vec2::new(0.0, 0.0);
    let initial_player_size = Vec2::new(64.0, 32.0);
    create_app(initial_player_position, initial_player_size);
}
```

As the game we create is 2D, both a position and a size are two dimensional.

The test is generous: calling `create_app` must be possible with two arguments,
after which it should not crash.

## First fix

A valid stub would be:

```text
fn create_app(_position: Vec2, _size: Vec2) -> App {
  App::new()
}
```

The variable names starting with an underscore (`_`) denote that
their values are allowed to be unused. This is perfect for a stub!

## Second test: an empty `App` has no players

Next step is to count the number of players of an empty `App`,
so we have a reason to add a player.
We did the same last chapter too.

Here is the code:

```rust
fn test_empty_app_has_no_players() {
    let mut app = App::new();
    assert_eq!(count_n_players(&mut app), 0);
}
```

This is the last time I will repeat tests that are identical
to earlier chapters: it is not worth the space in a book.
The fix is identical to the one shown in the previous chapter.

## Third test: our `App` has a player

A slightly new test is to determine if `create_app`, now with
two arguments, indeed creates one player:

```rust
fn test_create_app_has_a_player() {
    let initial_player_position = Vec2::new(0.0, 0.0);
    let initial_player_size = Vec2::new(64.0, 32.0);
    let mut app = create_app(initial_player_position, initial_player_size);
    app.update();
    assert_eq!(count_n_players(&mut app), 1);
}
```

## Third fix

To fix this test, we need:

- a `Player` marker component
- create a player sprite
- a way to store the player position and size in that sprite

Creating a `Player` marker component is the same as in previous chapter:

```rust
#[derive(Component)]
pub struct Player;
```

`Player` is a marker component, as it does not store any additional information.
We could have chosen to store the player's position and size in this `Player`
structure. However, when adding the Bevy Components (plural!) for a sprite,
there will be a place to do so there.

In `create_app`, an empty `App` is created, after which a player is added:

```rust
pub fn create_app(initial_player_position: Vec2, initial_player_size: Vec2) -> App {
    let mut app = App::new();
    let add_player_fn = move |commands: Commands| {
        add_player(commands, initial_player_position, initial_player_size);
    };
    app.add_systems(Startup, add_player_fn);
    app
}
```

New to `create_app` is the use of a closure,
the `move |commands: Commands| { ...}`.
The closure allows us add a system to the `App`
with only one function argument (i.e. the `Commands`).
It does so by calling `add_player` with the captured function arguments.

Finally, `add_player` adds the structures needed to display a sprite,
here is its implementation:

```rust
fn add_player(mut commands: Commands, initial_player_position: Vec2, initial_player_size: Vec2) {
    commands.spawn((
        SpriteBundle {
            transform: Transform {
                translation: Vec2::extend(initial_player_position, 0.0),
                scale: Vec2::extend(initial_player_size, 1.0),
                ..default()
            },
            ..default()
        },
        Player,
    ));
}
```

Here I unpack `add_player`:

- `commands.spawn((...,...))`: adds a new entity that is a tuple of two things
- `SpriteBundle { ... }: adds a Bevy`SpriteBundle`, which is -unsurprisingly-
  a bundle of Components for a sprite. A Bevy bundle is a collection of
  Bevy Components, put into a structure. That structure has, among other,
  the elements`sprite`,`transform` and `texture`.
- `transform: Transform { ... }, ..default()`: initialize the `transform` field
  of the `SpriteBundle`, leave the rest at default values
- `translation: ..., scale: ..., ..default()`:
  initialize the `translation` and `scale` fields with particular value,
  keeping the others at default values. A translation is a relative (3D)
  movement compared to the origin (i.e, at coordinate `(0, 0, 0)`)
- `Vec2::extend(initial_player_position, 0.0)`: create a 3D coordinate,
  by extending our 2D position with a z coordinate of zero
- `Vec2::extend(initial_player_size, 1.0)`: create a 3D scale of the sprite,
  by extending our 2D size with a z scale of one. A z scale of one means that
  the sprite will have its regular scale

Note that the player's size is stored in the `translate` field. One could argue that
we do not set the player's size, but the player's translation instead,
hence the variable `initial_player_size` should be called `initial_player_translation`.
However, in this context, we (and our other users) do want to set the player's
translation and we should ignore that in the implementation details we need to
modify a translation. This is a good feature of TDD: it prevents us from using
needlessly technical names.

## Fourth test: a player has a position

Our previous implementation could (and maybe should) have been done sloppier.
Here we enforce that the player's 2D position is implemented correctly:

```rust
fn test_get_player_position() {
    let initial_player_position = Vec2::new(1.2, 3.4);
    let initial_player_size = Vec2::new(64.0, 32.0);
    let mut app = create_app(initial_player_position, initial_player_size);
    app.update();
    assert_eq!(get_player_position(&mut app), initial_player_position);
}
```

## Fourth fix

Here is an implementation to get back the player's
position from the complex thing we added:

```rust
fn get_player_position(app: &mut App) -> Vec2 {
    let mut query = app.world_mut().query::<(&Transform, &Player)>();
    let (transform, _) = query.single(app.world());
    assert_eq!(transform.translation.z, 0.0); // 2D
    transform.translation.xy()
}
```

The function is now a bit more complex.

The query now has `(&Transform, &Player)` tuple in its template arguments.
The English, the query would read as: 'let me ask for all entities
that have both a `Transform` and a `Player` component'.
The `Transform` component is one of the 7-9 components of a `SpriteBundle`,
which we will need to get the `translate` field of.
The `Player` component is our own marker component, that now actually
marks something: it marks which `Transform` belongs to the player.
A `Transform` is a Bevy component that is used for other things too,
among others, the position of the camera. Due to this, we cannot query
only for `Transform`, as there will be more `Transform`s in our application.

As we asked for a query matching the tuple `(&Transform, &Player)`,
our (single, thanks to `single`) result will be of the same type.
Of that tuple, we only keep the `Transform` and ignore the (empty) `Player`.

Of the `Transform`, we assume that the z coordinate is zero:
we are working on a 2D game after all! Instead of only assuming this to be
true, we can let Rust confirm this for real. The `assert` macros exist
to do exactly that. Hence, instead of commenting or documenting that the
z coordinate is zero, we `assert` this to be so.
Use assertions to document you assumptions `[Lakos, 1996]` `[McConnell, 2004a]`
`[Stroustrup, 1997]` `[Sutter & Alexandrescu, 2004]`.
Use assertions liberally `[Liberty, 2001]` `[Stroustrup, 2012]`.

Of the 3D `Transform` (with a z coordinate of zero),
we return the x and y coordinate of the translation.

## Fifth test: a player has a size

Now we can work with a player's position, we do the same for a player's size:

```rust
fn test_player_has_a_custom_size() {
    let initial_player_position = Vec2::new(1.2, 3.4);
    let initial_player_size = Vec2::new(64.0, 32.0);
    let mut app = create_app(initial_player_position, initial_player_size);
    app.update();
    assert_eq!(get_player_size(&mut app), initial_player_size);
}
```

This test is nearly identical to the previous test,
except now for using `get_player_size` and comparing it to the
initial player size.

## Fifth fix

The fix is nearly identical to the previous one:

```rust
fn get_player_size(app: &mut App) -> Vec2 {
    let mut query = app.world_mut().query::<(&Transform, &Player)>();
    let (transform, _) = query.single(app.world());
    assert_eq!(transform.scale.z, 1.0); // 2D
    transform.scale.xy()
}
```

This time, we assert that the player's scale is one,
which is needed for a 2D game.

## `main.rs`

All our tests pass! However, the we have not yet *seen* the player.
To see our game in action, we need the proper `main` function:

```rust
fn main() {
    let initial_player_position = Vec2::new(0.0, 0.0);
    let initial_player_size = Vec2::new(64.0, 32.0);
    let mut app = create_app(initial_player_position, initial_player_size);
    let add_camera_fun = |mut commands: Commands| {
        commands.spawn(Camera2dBundle::default());
    };
    app.add_systems(Startup, add_camera_fun);
    app.add_plugins(DefaultPlugins);
    app.run();
}
```

New to this `main` function is adding a camera, again using a closure.
The camera is needed to display a sprite.

This is how our game looks like now:

![The player is a big rectangle](add_player_sprite_4.png)

Setting the initial player size to the default (1.0, 1.0) would
result in the player being 1x1 pixels big:

![The player is a dot](add_player_sprite_2.png)

## Conclusion

We can now create an `App` with one player sprite,
where the player has, among others, a position and size.
When running the `App`, we can see the player.
We have tested everything that the App does!

Full code can be found at [https://github.com/richelbilderbeek/bevy_tdd_book_add_player_sprite](https://github.com/richelbilderbeek/bevy_tdd_book_add_player_sprite).

## References

- `[Lakos, 1996]` John Lakos. Large-Scale C++ Software Design. 1996. ISBN: 0-201-63362-0. Chapter 2.6: 'The use of assert statements can help to document the assumptions you make when implementing your code
- `[Liberty, 2001]` Jesse Liberty. Sams teach yourself C++ in 24 hours, 2nd edition. 2001. ISBN: 0-672-32224-2. Hour 24, chapter 'assert()': 'Use assert freely'
- `[McConnell, 2004a]` Steve McConnell. Code Complete (2nd edition). 2004. ISBN: -735619670. Chapter 8.2 'Assertions', paragraph 'Guidelines for using asserts': 'Use assertions to document and verify preconditions and postconditions'
- `[McConnell, 2004b]` Steve McConnell. Code Complete (2nd edition). 2004. ISBN: -735619670. Chapter 8.2 'Assertions', paragraph 'Guidelines for using asserts': 'Use assertions for conditions that should never occur'.
- `[Stroustrup, 1997]` Bjarne Stroustrup. The C++ Programming Language (3rd edition). 1997. ISBN: 0-201-88954-4. Advice 24.5.18: 'Explicitly express preconditions, postconditions, and other assertions as assertions'
- `[Stroustrup, 2012]` Bjarne Stroustrup. The C++ Programming Language (4th edition). 2013. ISBN: 978-0-321-56384-2. Chapter 30.5. Advice. page 884: '[13] Use static_assert() and assert() extensively'
- `[Sutter & Alexandrescu, 2004]` Herb Sutter, Andrei Alexandrescu. C++ coding standards: 101 rules, guidelines, and best practices. ISBN: 0-32-111358-6. Chapter 68: 'Assert liberally to document internal assumptions and invariants'
