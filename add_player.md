# Add player

This chapter shows how to add a player to a game.

## First test: an empty `App` has no players

First, we test that there is no player in an empty `App`:

```
fn test_empty_app_has_no_players() {
    let app = App::new(); // Need mut later
    app.update();
    assert_eq!(count_n_players(&app), 0);
}
```

The error will be that `count_n_players` is absent.

## First fix

Here is a possible implementation:

```rust
fn count_n_players(app: &mut App) -> usize {
    let mut query = app.world_mut().query::<&Player>();
    return query.iter(app.world_mut()).len();
}
```

This implementation is a simple definition way to count the
amount of `Player` components.

A new problem is that the `App` in the tests needs to be mutable:

```rust
fn test_empty_app_has_no_players() {
    let mut app = App::new();
    app.update();
    assert_eq!(count_n_players(&app), 0);
}
```

This is because querying a `World` cannot be done in a read-only way.
If you know how to do so, please [contribute](CONTRIBUTING.md)!

## Second test: create an `App`

This test will force us to write the `create_app` function:

```rust
fn test_can_create_app() {
    create_app();
}
```

## Second fix

A simple implementation of `create_app`:

```rust
pub fn create_app() -> App {
    let mut app = App::new();
    app
}
```

## Third test

Now that we can count the number of players,
we can test that our `App` starts with one player:

```rust
fn test_create_app_has_a_player() {
    let mut app = create_app();
    app.update();
    assert_eq!(count_n_players(&mut app), 1);
}
```

This will fail, as `create_app` does not create an `App` with
a player.

## Third fix

Here we add a `Player` component:

```rust
#[derive(Component)]
pub struct Player;

pub fn create_app() -> App {
    let mut app = App::new();
    app.add_systems(Startup, add_player);
    app.update();
    app
}

fn add_player(mut commands: Commands) {
    commands.spawn(Player);
}
```

The `Player` component is called a 'marker component',
as it has no state (i.e. member variables).
In the next chapter, you'll see that a marker component
is used to find other components associated/'marked' with a `Player`.
In that way, one can distinguish, for example, the position of a player
versus the position of a camera.

## `main.rs`

```rust
fn main() {
    let mut app = create_app();
    app.add_plugins(DefaultPlugins);
    app.run();
}
```

## Conclusion

We can now create an `App` with one player.
This one player is a marker component.
We have tested everything that the App does!

Full code can be found at [https://github.com/richelbilderbeek/bevy_tdd_book_add_player](https://github.com/richelbilderbeek/bevy_tdd_book_add_player).
