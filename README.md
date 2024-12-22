# bevy_tdd_book

Start of a book [1] called 'Developing Bevy games using TDD'.
The goal is to demonstrate how to do Test-Driven Development with Bevy.

* [FAQ](faq.md)

## Chapters

Code                                                                                    |Build                                                                                                                                                                                                                                                                              |Code coverage                                                                                                                                                                                                          |Chapter [2]                                                           |Description                          |Concepts
----------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------|-------------------------------------|------------------
[code](https://github.com/richelbilderbeek/bevy_tdd_book_hello_world)                   |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_hello_world/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_hello_world/actions/workflows/check_build.yaml)                                       |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_hello_world/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_hello_world)                                      |[hello_world.md](hello_world.md)                                      |Hello world                          |A minimal `App`
[code](https://github.com/richelbilderbeek/bevy_tdd_book_add_player)                    |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_add_player/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_add_player/actions/workflows/check_build.yaml)                                         |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_player/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_player)                                        |[add_player.md](add_player.md)                                        |Adding a player                      |Using `Components`
[code](https://github.com/richelbilderbeek/bevy_tdd_book_add_player_sprite)             |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_add_player_sprite/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_add_player_sprite/actions/workflows/check_build.yaml)                           |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_player_sprite/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_player_sprite)                          |[add_player_sprite.md](add_player_sprite.md)                          |Adding a player sprite               |Using closures and `SpriteBundles`
[code](https://github.com/richelbilderbeek/bevy_tdd_book_add_player_sprite_with_texture)|[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_add_player_sprite_with_texture/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_add_player_sprite_with_texture/actions/workflows/check_build.yaml) |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_player_sprite_with_texture/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_player_sprite_with_texture)|[add_player_sprite_with_texture.md](add_player_sprite_with_texture.md)|Adding a player sprite with a texture|Using a texture
[code](https://github.com/richelbilderbeek/bevy_tdd_book_add_camera)                    |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_add_camera/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_add_camera/actions/workflows/check_build.yaml)                                         |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_camera/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_camera)                                        |[add_camera.md](add_camera.md)                                        |Adding a camera                      |Using closures and `Camera2dBundle`
[code](https://github.com/richelbilderbeek/bevy_tdd_book_move_player)                   |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_move_player/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_move_player/actions/workflows/check_build.yaml)                                       |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_player/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_player)                                      |[move_player.md](move_player.md)                                      |Move the player                      |Extending a structure, using a `Query`
[code](https://github.com/richelbilderbeek/bevy_tdd_book_move_camera)                   |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_move_camera/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_move_camera/actions/workflows/check_build.yaml)                                       |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_camera/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_camera)                                      |[move_camera.md](move_camera.md)                                      |Move the camera                      |.
[code](https://github.com/richelbilderbeek/bevy_tdd_book_move_player_with_keyboard)     |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_move_player_with_keyboard/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_move_player_with_keyboard/actions/workflows/check_build.yaml)           |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_player_with_keyboard/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_player_with_keyboard)          |[move_player_with_keyboard.md](move_player_with_keyboard.md)          |Respond to keyboard                  |.
[code](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_key_press)          |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_key_press/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_key_press/actions/workflows/check_build.yaml)                     |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_key_press/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_key_press)                    |[respond_to_key_press.md](respond_to_key_press.md)                    |Respond to keyboard, minimal example |Minimal example, key press
[code](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_just_key_pressed)   |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_just_key_pressed/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_just_key_pressed/actions/workflows/check_build.yaml)       |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_just_key_pressed/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_just_key_pressed)      |[respond_to_just_key_pressed.md](respond_to_just_key_pressed.md)      |Respond to keyboard, minimal example |Minimal example, key just being pressed
[code](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_move)         |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_move/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_move/actions/workflows/check_build.yaml)                   |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_mouse_move/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_mouse_move)                  |[respond_to_mouse_move.md](respond_to_mouse_move.md)                  |Respond to mouse, minimal example    |Minimal example, mouse move
[code](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_button_press) |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_button_press/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_button_press/actions/workflows/check_build.yaml)   |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_mouse_button_press/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_mouse_button_press)  |[respond_to_mouse_button_press.md](respond_to_mouse_button_press.md)  |Respond to mouse, minimal example    |Minimal example, mouse button press
[code](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_turn)   |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_turn/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_turn/actions/workflows/check_build.yaml)       |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_turn/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_turn)      |[respond_to_mouse_wheel_turn.md](respond_to_mouse_wheel_turn.md)      |Respond to mouse, minimal example    |Minimal example, mouse wheel turn
[code](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_press)  |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_press/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_press/actions/workflows/check_build.yaml)     |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_press/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_press)    |[respond_to_mouse_wheel_press.md](respond_to_mouse_wheel_press.md)    |Respond to mouse, minimal example    |Minimal example, mouse wheel press


## Chapter overview

```mermaid
flowchart TD
  hello_world[hello_world\nGet started]
  add_player[add_player\nAdd a player]
  add_player_sprite[add_player_sprite\nAdd a player sprite]
  add_camera[add_camera\nAdd a camara]
  move_camera[move_camera\nMove the camera]
  move_player[move_player\nMove the player]
  move_player_keyboard[move_player_keyboard\nMove the player\nusing keyboard]
  move_player_mouse[move_player_mouse\nMove the player\nusing mouse]

  respond_to_key_press[respond_to_key_press\nRespond to a\nkey press]
  respond_to_mouse_move[respond_to_mouse_move\nRespond to a\nmouse move]
  respond_to_mouse_button_press[respond_to_mouse_button_press\nRespond to a\nmouse button press]
  respond_to_mouse_wheel_press[respond_to_mouse_wheel_press\nRespond to a\nmouse wheel press]
  respond_to_mouse_wheel_turn[respond_to_mouse_wheel_turn\nRespond to a\nmouse wheel turn]
  respond_to_just_key_pressed[respond_to_just_key_pressed\nRespond to a key\nthat has just been pressed]

  hello_world --> add_player
  add_player_sprite --> respond_to_key_press
  add_player_sprite --> respond_to_just_key_pressed
  add_player_sprite --> respond_to_mouse_move
  add_player_sprite --> respond_to_mouse_button_press
  add_player_sprite --> respond_to_mouse_wheel_press
  add_player_sprite --> respond_to_mouse_wheel_turn


  respond_to_key_press --> move_player_keyboard
  respond_to_just_key_pressed --> move_player_keyboard

  add_player --> add_player_sprite
  add_player_sprite --> move_player
  add_player_sprite --> add_camera
  add_camera --> move_camera

  move_camera -.- |similar\nchapters| move_player

  move_player --> move_player_keyboard
  move_player --> move_player_mouse

  respond_to_mouse_move --> move_player_mouse
```

## Files used by continuous integration scripts

Filename                              |Descriptions
--------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------
[mlc_config.json](mlc_config.json)    |Configuration of the link checker, use `markdown-link-check --config mlc_config.json --quiet docs/**/*.md` to do link checking locally
[.spellcheck.yml](.spellcheck.yml)    |Configuration of the spell checker, use `pyspelling -c .spellcheck.yml` to do spellcheck locally
[.wordlist.txt](.wordlist.txt)        |Whitelisted words for the spell checker, use `pyspelling -c .spellcheck.yml` to do spellcheck locally
[.markdownlint.jsonc](.markdownlint.jsonc)|Configuration of the markdown linter, use `markdownlint "**/*.md"` to do markdown linting locally. The name of this file is a default name.
[.markdownlintignore](.markdownlintignore)|Files ignored by the markdown linter, use `markdownlint "**/*.md"` to do markdown linting locally. The name of this file is a default name.

## Contributors

These are people that helped me, in alphabetical order:

* [`inodentry`](https://github.com/inodentry) for starting [the Unofficial Bevy Cheat Book](https://github.com/bevy-cheatbook/bevy-cheatbook), as well as its contributors
* `kristoff3r`: answered a question on the Bevy Discord channel
* `Periwinkle`: answered a question on the Bevy Discord channel
* `Shane Celis`: helped answer a question on the Bevy Discord channel
* `Trent (SleepyTea)`: helped answer a question on the Bevy Discord channel
* `Ziven`: helped answer a question on the Bevy Discord channel

## Footnotes

* [1] 'book' is an overstatement for now: it is just a collection of notes
* [2] There is no chapter numbering yet

## Links

* [Blog post 'Test-Driven Development in Rust Game Development with Bevy' by Edgardo Carreras](https://edgardocarreras.com/blog/tdd-in-rust-game-engine-bevy/)
