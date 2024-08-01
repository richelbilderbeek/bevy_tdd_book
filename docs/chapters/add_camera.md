# Add camera

In this chapter, we add adding a camera to our test suites.

This chapter introduces:

- the Bevy `Camera2dBundle` bundle
- a local closure

## First test

Similar to earlier chapters, the test starts with
counting the number of cameras:

```rust
fn test_empty_app_has_no_cameras() {
    let mut app = App::new();
    app.update();
    assert_eq!(count_n_cameras(&mut app), 0);
}
```

## First fix

Similar to a `Text` component, we take a look
at [the Bevy documentation on the Camera2dBundle](https://docs.rs/bevy/latest/bevy/prelude/struct.Camera2dBundle.html)
and look for a field that feels unique. The `camera` field, of type `Camera`
is enough to make the test pass:

```rust
fn count_n_cameras(app: &mut App) -> usize {
    let mut query = app.world_mut().query::<&Camera>();
    return query.iter(app.world_mut()).len();
}
```

Also here, the assumption is that other Bevy plugins do not add
their own `Camera`s. As long as it is the case that our camera is the
only `Camera`, this implementation is good enough and does not need
a marker component.

## Second test

Our game will have a camera with a custom scale.
Instead of repeating the smaller steps as in the earlier chapters,
here we test many new things as one:

```rust
fn test_create_app_uses_camera_scale() {
    let initial_camera_scale = 1.2;
    let mut app = create_app(initial_camera_scale);
    app.update();
    assert_eq!(count_n_cameras(&mut app), 1);
    assert_eq!(get_camera_scale(&mut app), initial_camera_scale);
}
```

In TDD, one should have many small tests and only add one tests that breaks
at the same time. However, to save book pages, I've combined the three
tests into one.

## Second fix

To fix all this, we need to:

- write a `create_app` function that uses our desired camera scale
  and add a camera with that scale
- write a `get_camera_scale` function that reads the camera's scale

The `create_app` function is similar to earlier versions:

```rust
pub fn create_app(initial_camera_scale: f32) -> App {
    let mut app = App::new();
    let add_camera_fun = move |mut commands: Commands| {
        let mut bundle = Camera2dBundle::default();
        bundle.projection.scale = initial_camera_scale;
        commands.spawn(bundle);
    };
    app.add_systems(Startup, add_camera_fun);
    app
}
```

One difference is the use of a local closure: instead of writing
a new function called -for example- `add_camera`, the things that
it would need to do are written in the closure's body.

Writing the `get_camera_scale` is also similar to earlier functions:

```rust
fn get_camera_scale(app: &mut App) -> f32 {
    let mut query = app.world_mut().query::<&OrthographicProjection>();
    let projection = query.single(app.world());
    projection.scale
}
```

Here, we query for the same `projection` field of a `Camera2dBundle`
of data type `OrthographicProjection` as we've used in the `create_app`
function.

## Third tests

We do want to be able to see something. Hence, we'll probably want to
add a player with or without a texture. I've picked to add
a player in the same way as chapter [`add_player`](add_player.md)
and re-used the same tests and implementations.

## Running `main`

As our `create_app` now also adds a camera, the `main` function
simplifies to:

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
