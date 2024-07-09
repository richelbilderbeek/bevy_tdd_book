# Add player sprite

This chapter shows how to add a player sprite to a game.

## First test: an empty `App` has no players

```rust
fn test_empty_app_has_no_players() {
    let mut app = App::new();
    assert_eq!(count_n_players(&mut app), 0);
}
```

## First fix

```rust
fn count_n_players(app: &mut App) -> usize {
    let mut query = app.world_mut().query::<(&Transform, &Player)>();
    return query.iter(app.world_mut()).len();
}
```

## Second test: our `App` has a player

```rust
fn test_create_app_has_a_player() {
    let mut app = create_app();
    app.update();
    assert_eq!(count_n_players(&mut app), 1);
}
```

## Second fix

To store a player, here a `Player` marker component is created:

```rust
#[derive(Component)]
pub struct Player;
```

In `create_app`, an empty `App` is created, after which a player is added:

```rust
pub fn create_app(initial_player_position: Vec2, initial_player_scale: Vec2) -> App {
    let mut app = App::new();
    app.add_systems(Startup, add_player);
    app
}
```

Adding a player in practice is combining a `SpriteBundle` with the
`Player` marker component:

```rust
fn add_player(mut commands: Commands) {
    commands.spawn((
        SpriteBundle {
            ..default()
        },
        Player,
    ));
}
```

## Third test: a player has a coordinate

```rust
fn test_get_player_position() {
    let initial_player_position = Vec2::new(1.2, 3.4);
    let mut app = create_app(initial_player_position);
    app.update();
    assert_eq!(get_player_position(&mut app), initial_player_position);
}
```

## Third fix

We use a two-dimensional vector, as we only use the x and y axis:

```rust
fn get_player_position(app: &mut App) -> Vec2 {
    let mut query = app.world_mut().query::<(&Transform, &Player)>();
    let (transform, _) = query.single(app.world());
    transform.translation.xy()
}
```

We need to adept `create_app` to store a player's position:

```rust
pub fn create_app(initial_player_position: Vec2) -> App {
    let mut app = App::new();
    let add_player_fn = move |/* no mut? */ commands: Commands| {
        add_player(commands, initial_player_position);
    };
    app.add_systems(Startup, add_player_fn);
    app
}
```

In `add_player`, the initial player position is stored in the `Transform`.
The two-dimensional position is extended to have a z-coordinat of zero,
as Bevy does always use three-dimensional coordinates.

```rust
fn add_player(mut commands: Commands, initial_player_position: Vec2) {
    commands.spawn((
        SpriteBundle {
            transform: Transform {
                translation: Vec2::extend(initial_player_position, 0.0),
                ..default()
            },
            ..default()
        },
        Player,
    ));
}
```

## Fourth test: a player has a scale

```rust
fn test_player_has_a_custom_scale() {
    let initial_player_position = Vec2::new(1.2, 3.4);
    let initial_player_scale = Vec2::new(64.0, 32.0);
    let mut app = create_app(initial_player_position, initial_player_scale);
    app.update();
    assert_eq!(get_player_scale(&mut app), initial_player_scale);
}
```

## Fourth fix

We use a two-dimensional vector, as we only use the x and y axis:

```rust
fn get_player_scale(app: &mut App) -> Vec2 {
    let mut query = app.world_mut().query::<(&Transform, &Player)>();
    let (transform, _) = query.single(app.world());
    transform.scale.xy()
}
```

Rewrite part of `create_app` to allow for a two-dimensional scale:

```rust
pub fn create_app(initial_player_position: Vec2, initial_player_scale: Vec2) -> App {
    let mut app = App::new();
    let add_player_fn = move |/* no mut? */ commands: Commands| {
        add_player(commands, initial_player_position, initial_player_scale);
    };
    app.add_systems(Startup, add_player_fn);
    app
}
```

Store the player scale in the `Transform`.
The two-dimensional scale is extended to have a z-coordinat of 1.0,
which is assumed for two-dimensional games.

```rust
fn add_player(mut commands: Commands, initial_player_position: Vec2, initial_player_scale: Vec2) {
    commands.spawn((
        SpriteBundle {
            transform: Transform {
                translation: Vec2::extend(initial_player_position, 0.0),
                scale: Vec2::extend(initial_player_scale, 1.0),
                ..default()
            },
            ..default()
        },
        Player,
    ));
}
```

## OLD STUFF BELOW



To have a player have a coordinate, texture and all that is needed
for display, a Bevy `SpriteBundle` is used:

```rust
fn add_player(mut commands: Commands) {
    commands.spawn((SpriteBundle { ..default() }, Player));
}
```

## Second test

For our second test, we create a player at a custom position,
after which we test if indeed it has been created at that position:

```rust
#[test]
fn test_player_is_at_custom_place() {
    let initial_coordinat = Vec3::new(1.2, 3.4, 5.6);
    let mut app = create_app(initial_coordinat);
    app.update();
    assert_eq!(get_player_position(&mut app), initial_coordinat);
}
```

The `create_app` now has a new input argument: the initial coordinate
of the player. Because Rust has no default function arguments,
earlier tests need to be updated too.

## Second fix

Updating earlier code is done by adding `Vec3::new(0.0, 0.0, 0.0)`
as the input argument:

```rust
#[test]
fn test_player_is_at_origin() {
    let mut app = create_app(Vec3::new(0.0, 0.0, 0.0));
    app.update();
    assert_eq!(get_player_position(&mut app), Vec3::new(0.0, 0.0, 0.0));
}
```

This earlier test now uses correct function signatures.

Another update will be in `main.rs`:

```rust
fn main() {
    let mut app = create_app(Vec3::new(0.0, 0.0, 0.0));
    app.run();
}
```

To fix our newest test, most changes end up in
how a player is added and how an `App` is created.

The way Bevy works with sprites, is to use a `SpriteBundle`.
Here is a function that adds a player at a certain position:

```rust
fn add_player_with_sprite_at_pos(mut commands: Commands, initial_player_position: Vec3) {
    commands.spawn((
        SpriteBundle {
            transform: Transform {
                translation: initial_player_position,
                ..default()
            },
            ..default()
        },
        Player,
    ));
}
```

Then we use that function in `create_app`:

```rust
pub fn create_app(initial_player_position: Vec3) -> App {
    let mut app = App::new();
    let add_player_fn = move |/* no mut? */ commands: Commands| {
        add_player_with_sprite_at_pos(commands, initial_player_position)
    };
    app.add_systems(Startup, add_player_fn);
    // Do not do update, as this will disallow to do more steps
    // app.update(); //Don't!
    return app;
}
```

The most complex lines are where the `add_player_fn` closure is created:

```rust
let add_player_fn = move |/* no mut? */ commands: Commands| {
    add_player_with_sprite_at_pos(commands, initial_player_position)
};
app.add_systems(Startup, add_player_fn);
```

`app.add_systems` expects to receive function that works on `Commands`,
without any extra parameters. This means that
`app.add_systems(Startup, add_player_with_sprite_at_pos)` would not fit,
as `add_player_with_sprite_at_pos` expect an initial position as well.
The technique to make a partially evaluated function we use here is called
a 'closure': we create a function that only works on `Commands` (i.e.
the part between vertical bars).
The closure then uses the `initial_player_position` when needed.

## `main.rs` after second fix

We want to see the graphics of our game and now is the time!
To do so, one needs to add a `Camera2dBundle`
and the `DefaultPlugins` like this:

```rust
fn main() {
    let mut app = create_app(Vec3::new(0.0, 0.0, 0.0));
    let add_camera_fun = |mut commands: Commands| {
        commands.spawn(Camera2dBundle::default());
    };
    app.add_systems(Startup, add_camera_fun);
    app.add_plugins(DefaultPlugins);
    app.run();
}
```

Running the `main` function allows us to see that our game now
displays a white dot at the center of the screen:

![The player is a dot](add_player_sprite_2.png)

Yay!

## Third test

The player should be more than just a dot.
To make a player bigger, one needs to modify
the scale of its, so-called, transformation.
The transformation of a sprite, as per Bevy `Transform` class,
contains the position ('translation'), size ('scale') and more thing.
The default scale of any Bevy `Transform` is the `(1.0, 1.0, 1.0)`,
which can be read as a one-to-one scale in x, y and z direction.

We can put that in a test:

```rust
#[test]
fn test_player_has_unity_scale() {
    let mut app = create_app(Vec3::new(0.0, 0.0, 0.0));
    app.update();
    assert_eq!(get_player_scale(&mut app), Vec3::new(1.0, 1.0, 1.0));
}
```

## Third fix

After `get_player_position`,
getting the scale of a player is a simple adaptation:

```rust
fn get_player_scale(app: &mut App) -> Vec3 {
    let mut query = app.world.query::<(&Transform, &Player)>();
    let (transform, _) = query.single(&app.world);
    return transform.scale;
}
```

## Fourth test

Now it is time to make the player bigger:

```rust
#[test]
fn test_player_has_a_custom_scale() {
    let player_scale = Vec3::new(1.1, 2.2, 3.3);
    let mut app = create_app(Vec3::new(0.0, 0.0, 0.0), player_scale);
    app.update();
    assert_eq!(get_player_scale(&mut app), player_scale);
}
```

It is cumbersome to add an extra argument to `create_app`
and we will need to fix this everywhere. Luckily, in the next step,
we'll refactor this to allow our game to grow more easily.

## Fourth fix

The modifications needed are repeats of what we did before:

Adding a player now needs an initial scale:

```rust
fn add_player_with_sprite_at_pos_with_scale(
    mut commands: Commands,
    initial_player_position: Vec3,
    initial_player_scale: Vec3,
) {
    commands.spawn((
        SpriteBundle {
            transform: Transform {
                translation: initial_player_position,
                scale: initial_player_scale,
                ..default()
            },
            ..default()
        },
        Player,
    ));
}
```

The `create_app` needs to have an extra argument,
that needs to be read by the closure:

```rust
pub fn create_app(initial_player_position: Vec3, initial_player_scale: Vec3) -> App {
    let mut app = App::new();
    let add_player_fn = move |/* no mut? */ commands: Commands| {
        add_player_with_sprite_at_pos_with_scale(
            commands,
            initial_player_position,
            initial_player_scale,
        );
    };
    app.add_systems(Startup, add_player_fn);

    // Do not do update, as this will disallow to do more steps
    // app.update(); //Don't!
    return app;
}
```

## `main.rs` after fourth fix

Also the `main` function needs to be updated.
This is where one can determine the size of the player:

```rust
fn main() {
    let mut app = create_app(Vec3::new(0.0, 0.0, 0.0), Vec3::new(100.0, 20.0, 1.0));
    let add_camera_fun = |mut commands: Commands| {
        commands.spawn(Camera2dBundle::default());
    };
    app.add_systems(Startup, add_camera_fun);
    app.add_plugins(DefaultPlugins);
    app.run();
}
```

Running the game now shows a proper player:

![The player is a big rectangle](add_player_sprite_4.png)

## Fifth test: prepare refactoring

A game has many parameters. Adding each parameter to `create_app` is a bad idea,
as one will need to keep modifying all earlier tests. Instead, `create_app`
will always work on a `GameParameters` structure. When this is the case,
all tests can work on a default `GameParameters` structure.

The initial test is trivial:

```rust
#[test]
fn test_create_default_game_parameters() {
    create_default_game_parameters();
}
```

Because it is trivial, I will also show the other tests,
so one can see that code will be moved to this structure:

```rust
#[test]
fn test_initial_player_position() {
    assert_eq!(
        create_default_game_parameters().initial_player_position,
        Vec3(0.0, 0.0, 0.0)
    );
}

#[test]
fn test_initial_player_scale() {
    assert_eq!(
        create_default_game_parameters().initial_player_scale,
        Vec3::new(100.0, 20.0, 1.0)
    );
}
```

These values are the ones used earlier.

## Fifth fix

Setting up `GameParameters` is as complex as setting up any basic structure:

```rust
struct GameParameters {
    initial_player_position: Vec3,
    initial_player_scale: Vec3,
}

fn create_default_game_parameters() -> GameParameters {
    return GameParameters {
        initial_player_position: Vec3::new(0.0, 0.0, 0.0),
        initial_player_scale: Vec3::new(100.0, 20.0, 1.0),
    };
}
```

## Six test: refactoring

Time to put the `GameParameters` structure to work!

The trivial test `test_can_create_app` ...

```rust
#[test]
fn test_can_create_app() {
    create_app(Vec3::new(0.0, 0.0, 0.0), Vec3::new(1.0, 1.0, 1.0));
}
```

is changed to:

```rust
#[test]
fn test_can_create_app() {
    create_app(create_default_game_parameters());
}
```

This test needs to become the first to pass.

## Sixth fix

Fixing `create_app` is not too complex:

```rust
pub fn create_app(game_parameters: GameParameters) -> App {
    let mut app = App::new();
    let add_player_fn = move |/* no mut? */ commands: Commands| {
        add_player_with_sprite_at_pos_with_scale(
            commands,
            game_parameters.initial_player_position,
            game_parameters.initial_player_scale,
        );
    };
    app.add_systems(Startup, add_player_fn);

    // Do not do update, as this will disallow to do more steps
    // app.update(); //Don't!
    return app;
}
```

Fixing the tests is done by calling `create_default_game_parameters`
when needed. Sometimes this structure needs to be modified within the test:

```rust
#[test]
fn test_player_is_at_custom_place() {
    let initial_coordinat = Vec3::new(1.2, 3.4, 5.6);
    let mut game_parameters = create_default_game_parameters();
    game_parameters.initial_player_position = initial_coordinat;
    let mut app = create_app(game_parameters);
    app.update();
    assert_eq!(get_player_position(&mut app), initial_coordinat);
}
```

There is a test that needs to be deleted, as it has become incorrect:

```rust
#[test]
fn test_player_has_unity_scale() {
    let mut app = create_app(create_default_game_parameters());
    app.update();
    assert_eq!(get_player_scale(&mut app), Vec3::new(1.0, 1.0, 1.0));
}
```

## Conclusion

We can now create an `App` with one player sprite,
where the player has, among others, a position, scale  and a texture.
When running the `App`, we can see the player.
However, we do have tested everything that the App does!

Full code can be found at [https://github.com/richelbilderbeek/bevy_tdd_book_add_player_sprite](https://github.com/richelbilderbeek/bevy_tdd_book_add_player_sprite).
