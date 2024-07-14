# Respond to a mouse button press

This chapter shows how to respond to a mouse button press.

The idea is to do something upon a mouse button press.

## First test: an emty `App` has no players

Forces us to write `count_n_players`.

```rust
fn test_empty_app_has_no_players() {
    let mut app = App::new();
    assert_eq!(count_n_players(&mut app), 0);
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

## Third test: player is at the origin

```rust
fn test_player_is_at_origin() {
    let mut app = create_app();
    app.update();
    assert_eq!(get_player_position(&mut app), Vec2::new(0.0, 0.0));
}
```

## Fourth test: player position changes upon mouse button press

```rust
fn test_player_responds_to_mouse_button_press() {
    let mut app = create_app();
    assert!(app.is_plugin_added::<InputPlugin>());
    app.update();

    // Not moved yet
    assert_eq!(Vec2::new(0.0, 0.0), get_player_position(&mut app));

    // Press the left mouse button
    app.world_mut()
        .resource_mut::<ButtonInput<MouseButton>>()
        .press(MouseButton::Left);

    app.update();

    // Position must have changed now
    assert_ne!(Vec2::new(0.0, 0.0), get_player_position(&mut app));
}
```

## Conclusion

We can now create an `App` with something that responds
to mouse button press.
We have tested everything that the `App` does!

Full code can be found at [https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_button_press](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_button_press).
