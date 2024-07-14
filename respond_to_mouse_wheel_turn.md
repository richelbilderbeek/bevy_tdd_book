# Respond to a mouse wheel turn

This chapter shows how to respond to a mouse wheel turn.

The idea is to do something upon a mouse wheel turn.

## First test: create an `App`

A trivial test, to get us to write `create_app`:

```rust
#[test]
fn test_can_create_app() {
    create_app();
}
```

## Second test: no players at the start

Forces us to write `count_n_players`.

```rust
fn test_empty_app_has_no_players() {
    let mut app = App::new();
    assert_eq!(count_n_players(&mut app), 0);
}
```

## Third test: add a player

```rust
fn test_create_app_has_a_player() {
    let mut app = create_app();
    app.update();
    assert_eq!(count_n_players(&mut app), 1);
}
```

## Fourth test: player is at the origin

```rust
fn test_player_is_at_origin() {
    let mut app = create_app();
    app.update();
    assert_eq!(get_player_position(&mut app), Vec2::new(0.0, 0.0));
}
```

## Fifth test: player position changes upon mouse wheel turn

```rust
fn test_player_responds_to_mouse_wheel_turn() {
    let mut app = create_app();
    assert!(app.is_plugin_added::<InputPlugin>());
    app.update();

    // Not moved yet
    assert_eq!(Vec2::new(0.0, 0.0), get_player_position(&mut app));

    // Scroll the mouse
    app.world_mut().send_event(bevy::input::mouse::MouseWheel {
        unit: bevy::input::mouse::MouseScrollUnit::Line,
        x: 10.0,
        y: 10.0,
        window: Entity::PLACEHOLDER,
    });
    app.update();

    // Moved now
    assert_ne!(Vec2::new(0.0, 0.0), get_player_position(&mut app));
}
```

## Conclusion

We can now create an `App` with something that responds
to a mouse wheel turn.
We have tested everything that the `App` does!

Full code can be found at [https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_turn](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_turn).
