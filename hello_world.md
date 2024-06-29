# Hello world

This chapter is a minimal Bevy program.

The minimal program will create a Bevy `App`
and then run it ([main.rs](https://github.com/richelbilderbeek/bevy_tdd_book_hello_world/blob/master/src/main.rs)):

```rust
use crate::app::create_app;
mod app;

fn main() {
    let mut app = create_app();
    app.run();
}
```

The `main` function will not be used in automated testing,
as it starts our game: starting the game
will require that a user needs to do something to close it.
Hence, the `main` function 'just' runs the `App`.

The testing takes place in the `create_app` function.
The first two lines of `main.rs` allow us to call the `create_app`
function in the file [app.rs](https://github.com/richelbilderbeek/bevy_tdd_book_hello_world/blob/master/src/app.rs).

Our first trivial test will be if `create_app` does something,
i.e. it does not crash:

```rust
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_can_create_app() {
        create_app();
    }
}
```

Writing this test will break the code, as the function `create_app`
does not exist yet.

Here is the `create_app` function definition that fixes all tests:

```rust
use bevy::prelude::*;

pub fn create_app() -> App {
    return App::new();
}
```

## Conclusion

We can now create an `App`. It does nothing and displays nothing. 
However, we do have tested everything (i.e. nothing) it does!

Full code can be found at [https://github.com/richelbilderbeek/bevy_tdd_book_hello_world](https://github.com/richelbilderbeek/bevy_tdd_book_hello_world)
