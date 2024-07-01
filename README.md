# bevy_tdd_book

Start of a book [1] called 'Developing Bevy games using TDD'.
The goal is to demonstrate how to do Test-Driven Development with Bevy.

* [FAQ](faq.md)

## Chapters

Code coverage                                                                                                                                                                                  |Chapter [2]                                 |Description
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------|----------------------
[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_hello_world/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_hello_world)              |[hello_world.md](hello_world.md)            |Hello world
[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_player/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_player)                |[add_player.md](add_player.md)              |Adding a player
[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_player_sprite/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_player_sprite)  |[add_player_sprite.md](add_player_sprite.md)|Adding a player sprite
[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_player/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_player)              |[move_player.md](move_player.md)            |Move a player

## Chapter overview

```mermaid
flowchart TD
    hello_world[hello_world\nGet started]
    add_player[add_player\nAdd a player]
    add_player_sprite[add_player_sprite\nAdd a player sprite]
    add_enemy[add_enemy\nAdd an enemy]
    move_enemy[move_enemy\nMove an enemy]
    move_player[move_player_keyboard\nMove a player]
    move_player_keyboard[move_player_keyboard\nMove a player\nusing keyboard]
    move_player_mouse[move_player_mouse\nMove a player\nusing mouse]

    hello_world --> add_player
    add_player --> add_enemy

    add_enemy --> move_enemy

    add_player --> add_player_sprite
    add_player_sprite --> move_player
    add_player_sprite --> move_player_keyboard
    add_player_sprite --> move_player_mouse
```

## Files used by continuous integration scripts

Filename                              |Descriptions
--------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------
[mlc_config.json](mlc_config.json)    |Configuration of the link checker, use `markdown-link-check --config mlc_config.json --quiet docs/**/*.md` to do link checking locally
[.spellcheck.yml](.spellcheck.yml)    |Configuration of the spell checker, use `pyspelling -c .spellcheck.yml` to do spellcheck locally
[.wordlist.txt](.wordlist.txt)        |Whitelisted words for the spell checker, use `pyspelling -c .spellcheck.yml` to do spellcheck locally
[.markdownlint.jsonc](.markdownlint.jsonc)|Configuration of the markdown linter, use `markdownlint "**/*.md"` to do markdown linting locally. The name of this file is a default name.
[.markdownlintignore](.markdownlintignore)|Files ignored by the markdown linter, use `markdownlint "**/*.md"` to do markdown linting locally. The name of this file is a default name.

## Footnotes

* [1] 'book' is an overstatement for now: it is just a collection of notes
* [2] There is no chapter numbering yet

## Links

* [Blog post 'Test-Driven Development in Rust Game Development with Bevy' by Edgardo Carreras](https://edgardocarreras.com/blog/tdd-in-rust-game-engine-bevy/)
