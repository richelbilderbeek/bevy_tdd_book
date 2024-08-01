# Add player

This chapter shows how to add a player to a game.

This chapter introduces:

- The `count_n_players` function
- `mut`-correctness
- A Bevy `Query`
- A Bevy `Component`
- A marker component
- A Bevy `System`
- A Bevy entity

## First test: an empty `App` has no players

First, we test that there are zero players in an empty `App`.
We could call the function `count_number_of_players`.
However, it is all too common to abbreviate 'number of' by an `n`,
resulting in the function name `count_n_players`:

```text
fn test_empty_app_has_no_players() {
    let app = App::new(); // Note 1: Need mut later
    app.update(); // Note 2: always update before testing
    assert_eq!(count_n_players(&app), 0);
}
```

The error will be that the `count_n_players` function is absent.

The comment `Note 1` is to foreshadow
that an `App` needs to be mutable to have its amount of players counted.
It is unexpected that a read-only operation (i.e. counting the amount of players)
requires the data it works on to be mutable. The Bevy library probably
has good reasons why it must be mutable.

The comment `Note 2` is to remind us to always call `app.update()`
before testing. An `app.update()` lets Bevy initialize an `App`
and it will give false results to do tests on uninitialized `App`s.
*Maybe* this test will pass without initialization,
but it would be an improperly conducted test.

In general, a read-only operation should work on an immutable data structure.
Correct use the Rust keyword `mut` is what I call `mut`-correctness,
which is similar to C++ const correctness. In C++, it is recommended to be
const correct `[C++ FAQ]` `[Cline et al., 1998]` `[Eckel, 2000]` `[Lakos, 1996]`
`[Sutter, 2004]`. As there is no reason why Rust would be different in this
regard, this book strives to be `mut`-correct (and please, contact me if you can
share a `mut`-correct implementation of `count_n_players`).

## First fix

Here is a possible implementation of `count_n_players`:

```rust
fn count_n_players(app: &mut App) -> usize {
    let mut query = app.world_mut().query::<&Player>();
    return query.iter(app.world_mut()).len();
}
```

This implementation is a simple way to count the
amount of `Player` components. Here I break down the implementation:

- `let mut query`: we create a question to ask to Bevy.
  In the context of informatics, a question such as this is called 'a query'
- `app.world_mut()` denotes that we mutable (i.e. read and write)
  access to the `World` structure of a Bevy `App`. Unsurprisingly,
  the `World` structure holds all things that are part of the world
  in your game.
- `.query::<&Player>()` reads as '(from a world, ) get all the players'.
  To be precise: we queried the Bevy world for all entities of the `Player`
  `Component`. We will explain entities and components
  later; for now, the code `Player` is related to a
  component (whatever that is) for a player.
- `query.iter(app.world_mut())` reads as 'iterate over the
  answers of our question (applied to our world)'
- `.len()` is for counting the amount of players that are found

The Bevy `Query` is the workhorse for reading and writing
to your game world and it is very flexible: you'll
see many queries in different forms in this book.

As querying in Bevy requires the `App` to be mutable,
the `App` used in the tests needs to be mutable too.
This is the test we'll end up with:

```rust
fn test_empty_app_has_no_players() {
    let mut app = App::new();
    app.update();
    assert_eq!(count_n_players(&mut app), 0);
}
```

## Second test: our `App` has one player

Now that we can count the number of players,
we can test that an `App` we create has one player:

```rust
fn test_create_app_has_a_player() {
    let mut app = create_app();
    app.update();
    assert_eq!(count_n_players(&mut app), 1);
}
```

This will fail, as `create_app` does not create an `App` with
a player.

## Second fix

To add a `Player` object to our `App` we need to:

- Define a `Player` component
- Add it to our `App`

Here define a `Player` component:

```rust
#[derive(Component)]
pub struct Player;
```

In English this would read: 'a player is a component'.
To be more precise is that the `Player` structure is an extension
of the Bevy `Component` structure.

A Bevy `Component` is a blueprint for thing that
can be stored in a Bevy `World`.
Components are the workhorse unit in Bevy: you'll create components,
query for components and -later- you'll bundle components.

There are two types of Bevy `Components`:

- marker components
- regular components

Marker components are Bevy `Component`s that are extended with only a name,
where a regular components extends a Bevy `Component` with a name and
member variables. The `Player` structure above is a marker component.

Adding our `Player` `Component` to our `App` takes two steps:

- Write an `add_player` function
- Let the `create_app` function call the `add_player` function

Here is the `create_app` function:

```rust
pub fn create_app() -> App {
    let mut app = App::new();
    app.add_systems(Startup, add_player);
    app
}
```

The new line introduces us to the Bevy `System`
and reads as 'in the startup phase, run the `add_player` function.

In Bevy, a 'system' is -loosely phrased- 'something that works on the world'.
This 'something' is typically a function.

Our `create_app` functions adds a system, called `add_player`,
that is run at the startup phase of the application,
then returns our `App`.

Here is the `add_player` function:

```rust
fn add_player(mut commands: Commands) {
    commands.spawn(Player);
}
```

This function has some magic to it:

- `mut commands: Commands`: this function argument is provided by Bevy.
  The `Commands` structure allows on the modify the Bevy world.
- `commands.spawn(Player add the entity of type Player to the world

After having modified `create_app`, added the `Player` `Component`
and the `add_player` function, the test passes. Well done!

## `main.rs`

To run our application, we need not change our `main` function,
it still looks like this:

```rust
fn main() {
    let mut app = create_app();
    app.add_plugins(DefaultPlugins);
    app.run();
}
```

## Conclusion

We can now create an `App` with one player.

We encountered all elements of the ECS paradigm that Bevy follows:

- Entity: an instance of a Component
- Component: a structure definition of something that can be used a in Bevy world
- System: a function that works on a Bevy world

We have tested everything that the App does!

The full code can be found at [https://github.com/richelbilderbeek/bevy_tdd_book_add_player](https://github.com/richelbilderbeek/bevy_tdd_book_add_player).

## References

- `[C++ FAQ]` [C++ FAQ](https://isocpp.org/faq), question [What is “const correctness”?](https://isocpp.org/wiki/faq/const-correctness#overview-const), accessed 2024-06-14. Answer: 'A good thing.'
- `[Cline et al., 1998]` Marshall Cline, Greg Lomow and Mike Girou. C++ FAQs, second edition. 1998. ISBN: 0-201-3098301. FAQ 14.05: 'Is const correctness tedious?' (Answer: no).
- `[Eckel, 2000]` Bruce Eckel. Thinking in C++, second edition, volume 1. 2000. ISBN: 0-13-979809-9. Item 8: 'Constants', paragraph 'Summary': 'const-correctness can be a lifesaver for projects'.
- `[Lakos, 1996]` John Lakos. Large-Scale C++ Software Design. 1996. ISBN: 0-201-63362-0. Chapter 9.1.6: 'Every object in a system should be const-correct'
- `[Sutter, 2004]` Herb Sutter. Exceptional C++ style. 2005. ISBN: 0-201-76042-8. Item 1 guideline: 'Be const correct'.