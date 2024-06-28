# FAQ

## Why this book?

There is only one [blog post on Test-Driven Development with Bevy](https://edgardocarreras.com/blog/tdd-in-rust-game-engine-bevy/)
and that is it.

This book tries to start from scratch and build up gradually.

## What is the goal of this book?

The goal is to demonstrate how to do Test-Driven Development ('TDD') with Bevy.

## What are the subgoals of this book?

* Always achieve 100% code coverage when ignoring 
the `main` function in `src/main.rs`.

## Why ignore the `main` function in `src/main.rs` for code coverage?

Because one cne cannot test the `main` function.
The `main` is where a game is started.
When the game is started, one needs user input to close the game.
TDD needs tests that do not require user input.

