# FAQ

## Why this book?

There is only one [blog post on Test-Driven Development with Bevy](https://edgardocarreras.com/blog/tdd-in-rust-game-engine-bevy/)
and that is it.

This book tries to start from scratch and build up gradually.

## What is the intended audience of this book?

Intermediate Rust developers: people that have read parts of
'The Rust programming language' `[Klabnik & Nichols, 2018]``[Klabnik & Nichols, 2023]`.

This book does not teach Rust, nor Bevy.
Instead, it shows Test-Driven Development in Rust with Bevy.

## What is the goal of this book?

The goal is to demonstrate how to do Test-Driven Development ('TDD')
in Rust with Bevy.

## What are the subgoals of this book?

* Always achieve 100% code coverage when ignoring
  the `main` function in `src/main.rs`.

## What are the non-goals of this book?

* Always have the fastest solution

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
