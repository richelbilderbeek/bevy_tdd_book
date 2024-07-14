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
fn test_create_app_uses_camera_size() {
    let initial_camera_size = 1.2;
    let mut app = create_app(initial_camera_size);
    app.update();
    assert_eq!(count_n_cameras(&mut app), 1);
    assert_eq!(get_camera_size(&mut app), initial_camera_size);
}
```

## Running `main`

```rust
fn main() {
    let initial_camera_size = 0.2;
    let mut app = create_app(initial_camera_size);
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
