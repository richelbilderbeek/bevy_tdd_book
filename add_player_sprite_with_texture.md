# Add player sprite with a texture

This chapter shows how to add a player sprite with a texture to a game.

## First test: an empty `App` has no players

```rust
fn test_empty_app_has_no_players() {
    let mut app = App::new();
    app.update();
    assert_eq!(count_n_players(&mut app), 0);
}
```

## Second test: our `App` has a players

```rust
fn test_our_app_has_a_player() {
    let mut app = create_app();
    app.update();
    assert_eq!(count_n_players(&mut app), 1);
}
```

## Third test: our player has a default size

```rust
fn test_player_has_the_default_size() {
    let mut app = create_app();
    app.update();
    assert_eq!(get_player_scale(&mut app), Vec2::new(1.0, 1.0));
}
```

## Fourth test: our player has a texture

```rust
fn test_player_has_a_texture() {
    let mut app = create_app();
    app.update();
    assert!(get_player_has_texture(&mut app));
}
```

## `main.rs`

```rust
fn main() {
    let mut app = create_app();
    let add_camera_fun = |mut commands: Commands| {
        commands.spawn(Camera2dBundle::default());
    };
    app.add_systems(Startup, add_camera_fun);
    assert!(!app.is_plugin_added::<AssetPlugin>());
    app.add_plugins(DefaultPlugins);
    app.run();
}
```

## Conclusion

We can now create an `App` with one player sprite that,
where the player has, among others, a position, scale and a texture.
When running the `App`, we can see the player.
We do tested everything that the App does!

Full code can be found at [https://github.com/richelbilderbeek/bevy_tdd_book_add_player_sprite_with_texture](https://github.com/richelbilderbeek/bevy_tdd_book_add_player_sprite_with_texture).
