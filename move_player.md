# Move a player

This chapter shows how to move a player.

The idea is to give a player a velocity,
making the player move on screen.

## First test: an empty `App` has no players

In `game_parameter.rs`:

```rust
fn test_empty_app_has_no_players() {
    let mut app = App::new();
    app.update();
    assert_eq!(count_n_players(&mut app), 0);
}
```

## Second test: our `App` stores an initial velocity

```rust
fn test_can_set_and_get_velocity() {
    let velocity = Vec2::new(1.2, 3.4);
    let mut app = create_app(velocity);
    app.update();
    assert_eq!(get_player_velocity(&mut app), velocity);
}
```


## Third test: our `App` has a player


```rust
fn test_create_app_has_a_player() {
    let velocity = Vec2::new(0.0, 0.0);
    let mut app = create_app(velocity);
    app.update();
    assert_eq!(count_n_players(&mut app), 1);
}
```


## Fourth test: the player starts at the origin

```rust
fn test_player_starts_at_the_origin() {
    let velocity = Vec2::new(0.0, 0.0);
    let mut app = create_app(velocity);
    app.update();
    assert_eq!(get_player_position(&mut app), Vec2::new(0.0, 0.0));
}
```

## Fifth test: a player moves

```rust
fn test_player_moves() {
    let velocity = Vec2::new(1.2, 3.4);
    let mut app = create_app(velocity);
    app.update(); // moves the player
    assert_ne!(get_player_position(&mut app), Vec2::new(0.0, 0.0));
}
```


## `main.rs`

To see that it works, this is the code we can use:

```rust
fn main() {
    let velocity = Vec2::new(0.2, 0.1);
    let mut app = create_app(velocity);
    let add_camera_fun = |mut commands: Commands| {
        commands.spawn(Camera2dBundle::default());
    };
    app.add_systems(Startup, add_camera_fun);
    app.add_plugins(DefaultPlugins);
    app.run();
}
```

We can indeed see our player move:

![The player moves](move_player.png)

## Conclusion

We can now create an `App` with one player sprite that moves.
When running the `App`, we can see the player moves.
We have tested everything that the App does!

Full code can be found at [https://github.com/richelbilderbeek/bevy_tdd_book_move_player](https://github.com/richelbilderbeek/bevy_tdd_book_move_player).
