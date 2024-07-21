# Move a camera

This chapter shows how to move a camera.

The idea is to give a camera a velocity,
making the camera move on screen.

This chapter introduces:

- TODO

## First test: our `App` needs a camera velocity

```rust
fn test_can_create_app_with_a_velocity() {
    let velocity = Vec2::new(0.2, 0.1);
    create_app(velocity);
}
```

## Second test: an empty `App` has no camera

```rust
fn test_empty_app_has_no_moving_cameras() {
    let mut app = App::new();
    app.update();
    assert_eq!(count_n_moving_cameras(&mut app), 0);
}
```

## Third test: our `App` has a camera

```rust
fn test_create_app_has_a_moving_camera() {
    let velocity = Vec2::new(0.0, 0.0);
    let mut app = create_app(velocity);
    app.update();
    assert_eq!(count_n_moving_cameras(&mut app), 1);
}
```

## Fourth test: camera starts at origin

```rust
fn test_camera_starts_at_origin() {
    let velocity = Vec2::new(0.0, 0.0);
    let mut app = create_app(velocity);
    app.update();
    assert_eq!(get_camera_position(&mut app), Vec2::new(0.0, 0.0));
}
```

## Fifth test: camera moves

```rust
fn test_moving_camera_moves() {
    let velocity = Vec2::new(1.2, 3.4);
    let mut app = create_app(velocity);
    app.update();
    assert_ne!(get_camera_position(&mut app), Vec2::new(0.0, 0.0));
}
```

## `main.rs`

```rust
fn main() {
    let velocity = Vec2::new(0.2, 0.1);
    let mut app = create_app(velocity);
    app.add_plugins(DefaultPlugins);
    app.run();
}
```

## Conclusion

We can now create an `App` with a camera that moves.
When running the `App`, we can see the camera moves.
We have tested everything that the App does!

Full code can be found at [https://github.com/richelbilderbeek/bevy_tdd_book_move_camera](https://github.com/richelbilderbeek/bevy_tdd_book_move_camera).
