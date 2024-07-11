# Hello world

This chapter is about creating a minimal Bevy program that is completely tested.

## First test

Our first test is about creating a Bevy program.
The Bevy class for this, is called [`App`](https://docs.rs/bevy/latest/bevy/app/struct.App.html).
Hence, we call the function to create a Bevy program `create_app`.

Our first trivial test will be if `create_app` does something, 
i.e. it does not crash:

```rust
fn test_can_create_app() {
    create_app();
}
```

This test will break the code, as the function `create_app` does not exist yet.

## First fix

Here is a possible implementation of `create_app`:

```rust
pub fn create_app() -> App {
    App::new()
}
```

Another option is to use `return App::new();` in the function body instead.
This, however, does not follow the Rust style recommended by the `clippy`
crate.

## `main.rs`

The `main` function will not be used in automated testing,
as it starts our game: starting the game
will require that a user needs to do something to close it.
Hence, the `main` function 'just' runs the `App`.

```rust
use crate::app::create_app;
mod app;

fn main() {
    let mut app = create_app();
    app.run();
}
```

## Conclusion

We can now create an `App`. It does nothing and displays nothing.
However, we do have tested everything (i.e. nothing) it does!

Full code can be found at [https://github.com/richelbilderbeek/bevy_tdd_book_hello_world](https://github.com/richelbilderbeek/bevy_tdd_book_hello_world)
