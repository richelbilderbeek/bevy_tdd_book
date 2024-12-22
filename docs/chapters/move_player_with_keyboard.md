# Move a player with a keyboard

This chapter shows how to move a player with a keyboard.

!!! note "Not ready for yet"

    This section remains unfinished until feedback about the previous sections
    has been received.

The idea is to give a player a velocity upon a key press.

This chapter introduces:

- TODO

## `main.rs`

```rust
fn main() {
    let mut app = create_app();
    let add_camera_fn = |mut commands: Commands| {
        commands.spawn(Camera2dBundle::default());
    };
    app.add_systems(Startup, add_camera_fn);

    assert!(!app.is_plugin_added::<InputPlugin>());
    app.add_plugins(DefaultPlugins);

    app.run();
}
```

## Conclusion

We can now create an `App` with one player sprite that responds
to key presses.
We have tested everything that the `App` does!

Full code can be found at [https://github.com/richelbilderbeek/bevy_tdd_book_move_player_with_keyboard](https://github.com/richelbilderbeek/bevy_tdd_book_move_player_with_keyboard).
