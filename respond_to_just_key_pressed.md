# Respond to a key just being pressed

This chapter shows how to respond to a key that is just being
pressed on a keyboard.

The idea is to do something upon a key just being pressed.

## First test: create an `App` does something

```rust
#[test]
fn test_can_create_app() {
    create_app();
}
```

## Second test: an empty `App` has no players

```rust
#[test]
fn test_empty_app_has_no_players() {
    let app = App::new();
    assert_eq!(count_n_players(&app), 0);
}
```

## Third test: an `App` has a player

```rust
#[test]
fn test_create_app_has_a_player() {
    let mut app = create_app();
    app.update();
    assert_eq!(count_n_players(&app), 1);
}
```

## Fourth test: an `App` has a player placed at the origin

```rust
#[test]
fn test_player_is_at_origin() {
    let mut app = create_app();
    app.update();
    assert_eq!(get_player_position(&mut app), Vec3::new(0.0, 0.0, 0.0));
}
```

## Fifth test: pressing spacebar moves the player

```rust
#[test]
fn test_player_responds_to_key_press() {
    let mut app = create_app();
    assert!(app.is_plugin_added::<InputPlugin>());
    app.update();

    // Not moved yet
    assert_eq!(Vec3::new(0.0, 0.0, 0.0), get_player_position(&mut app));

    // Press the Enter button, thanks kristoff3r
    app.world.send_event(KeyboardInput {
        key_code: KeyCode::Enter,
        logical_key: Key::Enter,
        state: ButtonState::Pressed,
        window: Entity::PLACEHOLDER,
    });

    app.update();

    // Position must have changed now
    assert_ne!(Vec3::new(0.0, 0.0, 0.0), get_player_position(&mut app));
}
```

## Conclusion

We can now create an `App` with something that responds
to a key press.
We have tested everything that the `App` does!

Full code can be found at [https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_just_key_pressed](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_just_key_pressed).
