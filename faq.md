# FAQ

## Book

### Why this book?

This book started from the question: 'Is Bevy suitable for Test-Driven Development?',
as the author was looking for a Rust gaming library
suitable for Test-Driven Development.

At the time of writing, there is only one [blog post on Test-Driven Development with Bevy](https://edgardocarreras.com/blog/tdd-in-rust-game-engine-bevy/),
which only has two tests. And that test suite has not been
built up from scratch.

This book tries to start from scratch and build up gradually,
always aiming for 100% code coverage.

When all facets of a game can be tested with 100% code coverage,
the question 'Is Bevy suitable for Test-Driven Development?'
can be answered with a 'yes'.

### What is the intended audience of this book?

Intermediate Rust developers: people that have read parts of
'The Rust programming language' `[Klabnik & Nichols, 2018]``[Klabnik & Nichols, 2023]`.

This book does not teach Rust, nor Bevy.
Instead, it shows Test-Driven Development in Rust with Bevy.

### What is the goal of this book?

The goal is to demonstrate how to do Test-Driven Development
in Rust with Bevy.

Each chapter introduces as few new concepts as possible.
Due to this, the first chapters do not result in a playable game yet.

## What are the subgoals of this book?

* Code is tested to work; it can be detected when the code is not working anymore
* Always achieve 100% code coverage when ignoring
  the `main` function in `src/main.rs`
* Follow the Rust idiom as suggested by the `clippy` Rust package
* Get the test to work as simply as possible
    * No marker `Components` when tests pass without using these
* The first chapters must be simple enough to reasonably be put in one single file
* Only call Bevy with `use bevy::prelude::*;`, use full names beyond that (e.g.
  `bevy::input::InputPlugin`) over adding more `use`s

### What are the non-goals of this book?

* Have a running game in each chapter
* Having an interesting game in the end
* Always have the fastest solution
* Explain Rust
* Explain Bevy
* Support code of older Bevy version
* Give tips that are of personal preference,
  unless described as such
* Use fancy idioms that are of personal preference,
  unless described as such

## Technical

### Why ignore the `main` function in `src/main.rs` for code coverage?

Because one cannot test the `main` function.

The `main` is where a game is started.
When the game is started, one needs user input to close the game.
TDD needs tests that do not require user input.

### Why don't you use dynamic linking?

The [Bevy setup](https://bevyengine.org/learn/quick-start/getting-started/setup/)
recommends to use dynamic linking, as this results in faster build times.

However, when using dynamic linking, I was unable to use the debugger
in neither Visual Studio Code, nor RustRover.

As I prefer using a debugger over fast build times, I choose to not
use dynamic linking and -indeed- wait a bit longer for a build to finish.

If you want to use dynamic linking, to a `Cargo.toml` file, change:

```text
[dependencies]
bevy = { version = "0.14.0" }
```

to

```text
[dependencies]
bevy = { version = "0.14.0", features = ["dynamic_linking"] }
```

## My open questions

### Use `setup_' or `add_` for functions that add components in the Setup phase?

The Bevy example often start functions that
add `Components` at the `App` at startup with `setup`, e.g. `setup_camera`.
As the functions **add** things, I use the verb `add` instead,
e.g. `add_camera`. Should I follow the -IMHO- better English description
of what the function does (i.e. use `add`),
or should I follow the Bevy social convention
to use `setup`?

### Is there a way to do a Query on a immutable World?

This is a test I would like to be able to write:

```rust
fn test_empty_app_has_no_players() {
    let app = App::new();
    assert_eq!(count_n_players(&app), 0);
}
```

The idea of `count_n_players` is to count the number of times a (marker) component is present.
Because we only read (i.e. do not modify the `App`), we can write `let app` (instead of `let mut app`).

Writing this test, however, fails when implementing `count_n_players`.

Below is an implementation that I wish I could write, that uses a query on an immutable `World`:

```rust
// Does not compile, as `query` expects a mutable World
fn count_n_players(app: &App) -> usize {
    let query = app.world().query::<&Player>();
    return query.iter(app.world()).len();
}
```

However, a query always needs a mutable World, hence an implementation that works is:

```rust
// Does not modify the App, I promise!
fn count_n_players(app: &mut App) -> usize {
    let mut query = app.world_mut().query::<&Player>();
    return query.iter(app.world_mut()).len();
}
```

I added a comment to illustrate that one needs to promise not to change an object, instead of enforcing it (i.e. not using `mut`).

With an implementation that uses `&mut App`, the test needs to be changed to:

```rust
fn test_empty_app_has_no_players() {
    let mut app = App::new();
    // Does not modify the App, I promise!
    assert_eq!(count_n_players(&mut app), 0);
}
```

Also here I added a comment to illustrate that one needs to promise not to change an object, instead of enforcing it (i.e. not using `mut`).

I assume that also in Bevy I express my promises in Rust, so how do I query something on an immutable `App`?

## References

* `[Klabnik & Nichols, 2018]` Klabnik, Steve, and Carol Nichols.
  The Rust programming language. No Starch Press, 2023.
* `[Klabnik & Nichols, 2023]` Klabnik, Steve, and Carol Nichols.
  The Rust programming language. No Starch Press, 2023.
