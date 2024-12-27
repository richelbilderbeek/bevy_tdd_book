---
tags:
  - respond
  - window
  - resize
---

# Respond to a window resize

This chapter shows how to respond to the resizing of a window.

!!! note "Not ready for yet"

    This section remains unfinished until feedback about the previous sections
    has been received.

The idea is to do something when a window resizes.

This chapter introduces:

- TODO

## First test: create an `App`

A trivial test, to get us to write `create_app`:

```rust
fn test_can_create_app() {
    create_app();
}
```

## Second test: an empty `App` has no texts

To force us to write `count_n_texts`.
The word `text` is shorthand for 'the `Text` `Component`
of a `Text2d`'.

```rust
fn test_empty_app_has_no_texts() {
    let mut app = App::new();
    assert_eq!(count_n_texts(&mut app), 0);
}
```

## Third test: our `App` has a text

Forces us to add a `Text2d`:

```rust
fn test_create_app_has_a_text() {
    let mut app = create_app();
    app.update();
    assert_eq!(count_n_texts(&mut app), 1);
}
```

## Fourth test: the text in our `App` is empty at the start

Forces us to write `get_text_text`:

```rust
fn test_text_at_start_is_empty() {
    let mut app = create_app();
    app.update();
    assert_eq!(get_text_text(&mut app), "");
}
```

## Fifth test: the text in our `App` changes upon a window resize

Forces us to change the text upon a window resize:

```rust
fn test_respond_to_window_resize() {
    let mut app = create_app();
    app.update();

    //Resize the window
    app.world_mut().send_event(bevy::window::WindowResized {
        window: Entity::PLACEHOLDER,
        width: 100.0,
        height: 100.0,
    });
    app.update();
    
    assert_ne!(get_text_text(&mut app), "");
}
```

Results in:

```rust
fn respond_to_window_resize(
    mut q: Query<&mut Text2d>,
    mut resize_reader: EventReader<bevy::window::WindowResized>,
) {
    let mut text = q.single_mut();
    for e in resize_reader.read() {
        text.0 = format!("{:.1} x {:.1}", e.width, e.height);
    }
}
```

and:

```rust
pub fn create_app() -> App {
    let mut app = App::new();

    // Only add this plugin in testing.
    // The main app will assume it to be absent
    if cfg!(test) {
        app.add_plugins(bevy::window::WindowPlugin::default());
    }

    // ...
    app.add_systems(Update, respond_to_window_resize);
    app
}
```

## `main.rs`

Running our `App`:

```rust
fn main() {
    let mut app = create_app();
    app.add_plugins(DefaultPlugins);
    app.run();
}
```

![The App responds to a window resize](respond_to_window_resize.png)

## Conclusion

We can now create an `App` with something that responds
to a window resize.
We have tested everything that the `App` does!

Full code can be found at [https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_window_resize](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_window_resize).
