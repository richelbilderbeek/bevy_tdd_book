# 1. Introduction

Welcome to this book!
This book is called 'Developing Bevy games using TDD'.
The goal of this book is to demonstrate how to do Test-Driven Development
with Bevy.

This introductory chapter describes the ideas behind this book.
If you want to dive right in, go to [the next chapter](../misc/basic_introduction.md) now!

## 1.1. Why this book?

This book started from the question:
'Is Bevy suitable for Test-Driven Development?',
as the author was looking for a Rust gaming library
suitable for Test-Driven Development.

At the time of writing, there is only one
[blog post on Test-Driven Development with Bevy](https://edgardocarreras.com/blog/tdd-in-rust-game-engine-bevy/),
which only has two tests. And that test suite has not been
built up from scratch.

This book started from the question: 'Is Bevy suitable for Test-Driven
Development?'. To answer this question,
this book aims for 100% code coverage in any code but the `main`
function.
Code coverage is the percentage of code that is tested
and is correlated with code 
quality `[Horgan et al., 1994][Del Frate et al., 1995]`
and 100% code coverage is mandatory to pass a code peer-review 
in some communities `[Hart et al., 2013]`.
When 100% code coverage is achieved,
the question 'Is Bevy suitable for Test-Driven
Development?' is -to me- answered with a 'yes'.

This book starts from scratch and builds up gradually.

## 1.2. What is the intended audience of this book?

This book is suitable for intermediate Rust developers: people that have
read parts of 'The Rust programming language'
`[Klabnik & Nichols, 2018][Klabnik & Nichols, 2023]`
and are able to write functions and structures.

This book does not teach Rust, nor Bevy.
Instead, it shows Test-Driven Development in Rust with Bevy.

## 1.3. What is the goal of this book?

The goal is to demonstrate how to do Test-Driven Development
in Rust with Bevy.

Each chapter introduces as much new concepts as needed,
which is as few as possible.
Due to this, the first chapters do not result in a playable game yet.

## 1.4. How to read this book?

Start at chapter 1 and then move
forwards chronologically,
as the book introduces concepts one at a time.
However, using this book as a reference for code snippets will
probably work out fine too.

## 1.5. References

- `[Del Frate et al., 1995]` Del Frate, Fabio, et al.
  "On the correlation between code coverage and software reliability."
  Proceedings of Sixth International Symposium on Software Reliability
  Engineering. ISSRE'95. IEEE, 1995.
- `[Hart et al., 2013]` Hart, Edmumd, et al.
  "rOpenSci-a collaborative effort to develop R-based tools for facilitating
  Open Science." figshare (2013): 791569.
- `[Horgan et al., 1994]` Horgan, Joseph R., Saul London, and Michael R. Lyu.
  "Achieving software quality with testing coverage measures."
  Computer 27.9 (1994): 60-69.
- `[Klabnik & Nichols, 2018]` Klabnik, Steve, and Carol Nichols.
  The Rust programming language. No Starch Press, 2018.
- `[Klabnik & Nichols, 2023]` Klabnik, Steve, and Carol Nichols.
  The Rust programming language. No Starch Press, 2023.

