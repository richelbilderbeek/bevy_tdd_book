# Contributing

Thanks for considering to contribute and reading this!

Here we discuss how to contribute:

- [spoken text](#spoken-text), e.g. ideas, feedback, etc. and are written in English.
- [book text](#book-text), e.g. textual changes to the book
- [code](#code), e.g. changes to the Rust code

## Spoken text

Spoken text suggestions are ideas, feedback, etc. and are written in English.

For ideas or feedback,
create an [Issue](https://github.com/richelbilderbeek/bevy_tdd_book/issues).
These Issues will be discussed publicly in that Issue
and will help shape the development of the book.

## Book text

Book text suggestions are suggested textual changes to the book.

To suggest these, either
create an [Issue](https://github.com/richelbilderbeek/bevy_tdd_book/issues)
or submit a Pull Request.

These Issues and Pull Requests will be discussed publicly
and accepted if they are judged to improve the book.
Of course, 'to improve the book' is subjective.

Here are things that are likely to be accepted:

- Fixing typo's
- Simplify wording and/or sentences

Here are things that are unlikely to be accepted:

- Anything that breaks a continuous integration test
- Anything that makes the continuous integration test suite less strict
- Anything that makes existing tests less strict
- In-depth technical explanations at a too early chapter

## Code

Code suggestions are suggested changes to the Rust code.

To suggest these, either
create an [Issue](https://github.com/richelbilderbeek/bevy_tdd_book/issues)
or submit a Pull Request.

These Issues and Pull Requests will be discussed publicly
and accepted if they are judged to improve the code.
Of course, 'to improve the code' is subjective.

Here are things that are likely to be accepted:

- Removing use of `mut` for read-only operations
- Using a more elegant construct that is just as readable

Here are things that are unlikely to be accepted:

- Anything that breaks a continuous integration test
- Anything that reduces code coverage below 100%
- Anything that makes the continuous integration test suite less strict
- Anything that makes existing tests less strict
- Using a faster, yet less readable alternative
