# Respond to a mouse wheel press

This chapter shows how to respond to a mouse wheel press.

The idea is to do something upon a mouse wheel press.

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
    let app = App::new();
    assert_eq!(count_n_players(&app), 0);
}
```

## Third test: add a player

```rust
fn test_create_app_has_a_player() {
    let mut app = create_app();
    app.update();
    assert_eq!(count_n_players(&app), 1);
}
```

## Fourth test: player is at the origin

```rust
fn test_player_is_at_origin() {
    let mut app = create_app();
    app.update();
    assert_eq!(get_player_position(&mut app), Vec3::new(0.0, 0.0, 0.0));
}
```

## Fifth test: player position changes upon mouse wheel turn


## Conclusion

We can now create an `App` with something that responds
to a mouse wheel press.
We have tested everything that the `App` does!

Full code can be found at [https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_press](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_press).
