---
tags:
  - chapter
  - add
  - camera
---

# 2.7. Add camera

In this chapter, we add adding a camera to our test suites.

![Our 'add_camera' game](add_camera.png)

This chapter introduces:

- the Bevy `Camera2d` bundle
- a local closure

## 2.7.1. :red_circle: First test

Similar to earlier chapters, the test starts with
counting the number of cameras:

```rust
fn test_empty_app_has_no_cameras() {
    let mut app = App::new();
    app.update();
    assert_eq!(count_n_cameras(&mut app), 0);
}
```

## 2.7.2. :green_circle: First fix

Similar to a `Text` component, we take a look
at [the Bevy documentation on the Camera2d](https://docs.rs/bevy/latest/bevy/prelude/struct.Camera2d.html)
and look for a field that feels unique. The `camera` field, of type `Camera`
is enough to make the test pass:

```rust
fn count_n_cameras(app: &mut App) -> usize {
    let mut query = app.world_mut().query::<&Camera>();
    return query.iter(app.world()).len();
}
```

Also here, the assumption is that other Bevy plugins do not add
their own `Camera`s. As long as it is the case that our camera is the
only `Camera`, this implementation is good enough and does not need
a marker component.

## 2.7.3. :red_circle: Second test

Our game will have a camera with a custom scale.
Instead of repeating the smaller steps as in the earlier chapters,
here we test many new things as one:

```rust
fn test_create_app_uses_camera_scale() {
    let initial_camera_scale = 1.2;
    let mut app = create_app(initial_camera_scale);
    assert_eq!(count_n_cameras(&mut app), 1);
    assert_eq!(get_camera_scale(&mut app), initial_camera_scale);
}
```

In TDD, one should have many small tests and only add one tests that breaks
at the same time. However, to save book pages, I've combined the three
tests into one.

Similar to [the 'Add a player sprite' chapter](add_player_sprite.md),
we do not need to add `app.update()` between creating the `App`
and running the tests, as `create_app` will do so.
Also here, when running our game normally,
our game will work as expected.

## 2.7.4. :green_circle: Second fix

To fix all this, we need to:

- write a `create_app` function that uses our desired camera scale
  and add a camera with that scale
- write a `get_camera_scale` function that reads the camera's scale

The `create_app` function is similar to earlier versions:

```rust
pub fn create_app(initial_camera_scale: f32) -> App {
    let mut app = App::new();
    let add_camera_fn = move |mut commands: Commands| {
        let mut bundle = Camera2d::default();
        bundle.projection.scale = initial_camera_scale;
        commands.spawn(bundle);
    };
    app.add_systems(Startup, add_camera_fn);
    app
}
```

One difference is the use of a local closure: instead of writing
a new function called -for example- `add_camera`, the things that
it would need to do are written in the closure's body.
Using a dedicated `add_camera` function could be considered
better readable and clearer (hence, used more often in this book),
it is useful to at least having seen the same approach with a local closure.

Using a

![The Bevy `Camera2d` documentation](bevy_doc_camera2d.png)

Writing the `get_camera_scale` is also similar to earlier functions:

```rust
fn get_camera_scale(app: &mut App) -> f32 {
    let mut query = app.world_mut().query::<&OrthographicProjection>();
    let projection = query.single(app.world());
    projection.scale
}
```

Here, we query for the same `projection` field of a `Camera2d`
of data type `OrthographicProjection` as we've used in the `create_app`
function.

## 2.7.5. :red_circle: Third tests

We do want to be able to see something. Hence, we'll probably want to
add a player with or without a texture. I've picked to add
a player in the same way as chapter [`add_player`](add_player.md)
and re-used the same tests and implementations.

## 2.7.6. Running `main`

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

## 2.7.7. Conclusion

We can now create an `App` with a camera.
When running the `App`, a rectangle is displayed.
We have tested everything that the App does!

Full code can be found at [https://github.com/richelbilderbeek/bevy_tdd_book_add_camera](https://github.com/richelbilderbeek/bevy_tdd_book_add_camera).
