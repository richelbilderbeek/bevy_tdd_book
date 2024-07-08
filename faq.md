# FAQ

## Why this book?

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

## What is the intended audience of this book?

Intermediate Rust developers: people that have read parts of
'The Rust programming language' `[Klabnik & Nichols, 2018]``[Klabnik & Nichols, 2023]`.

This book does not teach Rust, nor Bevy.
Instead, it shows Test-Driven Development in Rust with Bevy.

## What is the goal of this book?

The goal is to demonstrate how to do Test-Driven Development
in Rust with Bevy.

Each chapter introduces as few new concepts as possible.
Due to this, the first chapters do not result in a playable game yet.

## What are the subgoals of this book?

* Code is tested to work; it can be detected when the code is not working anymore
* Always achieve 100% code coverage when ignoring
  the `main` function in `src/main.rs`
* Follow the Rust idiom as suggested by the `clippy` Rust package

## What are the non-goals of this book?

* Have a running game in each chapter
* Having an interesting game in the end
* Always have the fastest solution
* Explain Rust
* Explain Bevy
* Support code of older Bevy version

## Why ignore the `main` function in `src/main.rs` for code coverage?

Because one cannot test the `main` function.

The `main` is where a game is started.
When the game is started, one needs user input to close the game.
TDD needs tests that do not require user input.

## References

* `[Klabnik & Nichols, 2018]` Klabnik, Steve, and Carol Nichols.
  The Rust programming language. No Starch Press, 2023.
* `[Klabnik & Nichols, 2023]` Klabnik, Steve, and Carol Nichols.
  The Rust programming language. No Starch Press, 2023.
