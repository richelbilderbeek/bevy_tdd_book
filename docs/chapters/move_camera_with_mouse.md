---
tags:
  - chapter
  - move
  - camera
  - mouse
---

# Move a camera with a mouse

This chapter shows how to move a camera with a mouse.

!!! note "Not ready for yet"

    This section remains unfinished until feedback about the previous sections
    has been received.

The idea is to change the camera's position, rotation and zoom upon mouse input.

These tests are the same as in the minimal examples.

This chapter introduces:

- TODO

## `main.rs`

```rust
fn main() {
    let mut app = create_app();
    app.add_plugins(DefaultPlugins);
    app.run();
}
```

Running the application shows the camera movement in action.

![The App in action](move_camera_with_mouse.png)

## Conclusion

We can now create an `App` with a camera that responds to key presses.
We have tested everything that the `App` does!

Full code can be found at [https://github.com/richelbilderbeek/bevy_tdd_book_move_camera_with_mouse](https://github.com/richelbilderbeek/bevy_tdd_book_move_camera_with_mouse).
