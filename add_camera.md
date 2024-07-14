# Add camera

## First test

```rust
fn test_empty_app_has_no_cameras() {
    let mut app = App::new();
    app.update();
    assert_eq!(count_n_cameras(&mut app), 0);
}
```

## Second test

```rust
fn test_create_app_uses_camera_scale() {
    let initial_camera_scale = 1.2;
    let mut app = create_app(initial_camera_scale);
    app.update();
    assert_eq!(count_n_cameras(&mut app), 1);
    assert_eq!(get_camera_scale(&mut app), initial_camera_scale);
}
```

## Running `main`

```rust
fn main() {
    let initial_camera_scale = 0.2;
    let mut app = create_app(initial_camera_scale);
    app.add_plugins(DefaultPlugins);
    app.run();
}
```

![The camera has zoomed in](add_camera.png)

## Conclusion

We can now create an `App` with a camera.
When running the `App`, a rectangle is displayed.
We have tested everything that the App does!

Full code can be found at [https://github.com/richelbilderbeek/bevy_tdd_book_add_camera](https://github.com/richelbilderbeek/bevy_tdd_book_add_camera).
