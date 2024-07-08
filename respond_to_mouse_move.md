# Respond to a mouse move

This chapter shows how to respond to a mouse move.

The idea is to do something upon a mouse move.

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

## Fifth test: player position changes upon mouse move

```rust
fn test_player_responds_to_mouse_move() {
    let mut app = create_app();
    assert!(app.is_plugin_added::<InputPlugin>());
    app.update();

    // Not moved yet
    assert_eq!(Vec3::new(0.0, 0.0, 0.0), get_player_position(&mut app));

    // Move the mouse
    app.world_mut().send_event(bevy::input::mouse::MouseMotion {
        delta: Vec2::new(100.0, 100.0),
    });

    app.update();

    // Position must have changed now
    assert_ne!(Vec3::new(0.0, 0.0, 0.0), get_player_position(&mut app));
}
```

Resulting in:

```rust
pub fn create_app() -> App {
    let mut app = App::new();

    // Only add this plugin in testing.
    // The main app will assume it to be absent
    if cfg!(test) {
        app.add_plugins(InputPlugin);
    }

    app.add_systems(Startup, add_player);
    app.add_systems(Update, respond_to_mouse_move);

    // Do not do update, as this will disallow to do more steps
    // app.update(); //Don't!
    app
}

fn respond_to_mouse_move(
    mut query: Query<&mut Transform, With<Player>>,
    mut mouse_motion_event: EventReader<MouseMotion>,
) {
    for event in mouse_motion_event.read() {
        let mut player_position = query.single_mut();
        player_position.translation.x += event.delta.x / 20.0;
        player_position.translation.y -= event.delta.y / 20.0;
    }
}
```

## Conclusion

We can now create an `App` with something that responds
to mouse movement.
We have tested everything that the `App` does!

Full code can be found at [https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_move](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_move).
