# bevy_tdd_book

[![Check chapters](https://github.com/richelbilderbeek/bevy_tdd_book/actions/workflows/check_chapters.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book/actions/workflows/check_chapters.yaml)
[![Check links](https://github.com/richelbilderbeek/bevy_tdd_book/actions/workflows/check_links.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book/actions/workflows/check_links.yaml)
[![Check markdown](https://github.com/richelbilderbeek/bevy_tdd_book/actions/workflows/check_markdown.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book/actions/workflows/check_markdown.yaml)
[![Check spelling](https://github.com/richelbilderbeek/bevy_tdd_book/actions/workflows/check_spelling.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book/actions/workflows/check_spelling.yaml)

Start of a book [1] called 'Developing Bevy games using TDD'.
The goal is to demonstrate how to do Test-Driven Development with Bevy.

- [FAQ](docs/misc/faq.md)

## Chapters

### Section 1: introduction

- [Section 1: Introduction](docs/introductions/main_introduction.md)
- [Section 2: Basics](docs/introductions/basic_introduction.md)

### Section 2: basics

```mermaid
flowchart TD
  introduction[1. Introduction]
  hello_world[2.1. hello_world\nGet started]
  add_player[2.2. add_player\nAdd a player]
  add_player_sprite[2.3. add_player_sprite\nAdd a player sprite]
  add_player_sprite_with_texture[2.4. add_player_sprite_with_texture\nAdd a player sprite\nwith a texture]
  add_camera[2.5. add_camera\nAdd a camara]
  move_player[2.6. move_player\nMove the player]
  add_text[2.7. add_text\nAdd text]

  introduction -.-> hello_world
  hello_world --> add_player
  add_player --> add_player_sprite
  add_player_sprite --> add_player_sprite_with_texture
  add_player_sprite_with_texture --> add_text
  add_player_sprite_with_texture --> add_camera
  add_player_sprite --> move_player
```

Code                                                                                    |Code coverage                                                                                                                                                                                                          |Chapter                                                                                  |Description                              |Concepts
----------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------|-----------------------------------------|------------------
[code](https://github.com/richelbilderbeek/bevy_tdd_book_hello_world)                   |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_hello_world/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_hello_world)                                      |2.1. [hello_world.md](docs/chapters/hello_world.md)                                      |Hello world                              |A minimal `App`
[code](https://github.com/richelbilderbeek/bevy_tdd_book_add_player)                    |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_player/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_player)                                        |2.2. [add_player.md](docs/chapters/add_player.md)                                        |Adding a player                          |Using a marker Component, using a `Query`
[code](https://github.com/richelbilderbeek/bevy_tdd_book_add_player_sprite)             |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_player_sprite/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_player_sprite)                          |2.3. [add_player_sprite.md](docs/chapters/add_player_sprite.md)                          |Adding a player sprite                   |Using closures and `SpriteBundles`
[code](https://github.com/richelbilderbeek/bevy_tdd_book_add_player_sprite_with_texture)|[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_player_sprite_with_texture/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_player_sprite_with_texture)|2.4. [add_player_sprite_with_texture.md](docs/chapters/add_player_sprite_with_texture.md)|Adding a player sprite with a texture    |Using a texture
[code](https://github.com/richelbilderbeek/bevy_tdd_book_add_text)                      |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_text/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_text)                                            |2.5. [add_text.md](docs/chapters/add_text.md)                                            |Adding text on screen                    |Using `Text2dBundle`
[code](https://github.com/richelbilderbeek/bevy_tdd_book_add_camera)                    |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_camera/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_camera)                                        |2.6. [add_camera.md](docs/chapters/add_camera.md)                                        |Adding a camera                          |Using `Camera2dBundle`
[code](https://github.com/richelbilderbeek/bevy_tdd_book_move_player)                   |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_player/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_player)                                      |2.7. [move_player.md](docs/chapters/move_player.md)                                      |Move the player                          |Extending a Component

### Section 3: user input

Code                                                                                    |Code coverage                                                                                                                                                                                                          |Chapter [2]                                                                         |Description                              |Concepts
----------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|-----------------------------------------|------------------
[code](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_window_resize)      |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_window_resize/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_window_resize)            |[respond_to_window_resize.md](docs/chapters/respond_to_window_resize.md)            |Respond to window resize, minimal example|Minimal example, mouse wheel press
[code](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_key_press)          |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_key_press/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_key_press)                    |[respond_to_key_press.md](docs/chapters/respond_to_key_press.md)                    |Respond to keyboard, minimal example     |Minimal example, key press
[code](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_just_key_pressed)   |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_just_key_pressed/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_just_key_pressed)      |[respond_to_just_key_pressed.md](docs/chapters/respond_to_just_key_pressed.md)      |Respond to keyboard, minimal example     |Minimal example, key just being pressed
[code](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_move)         |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_mouse_move/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_mouse_move)                  |[respond_to_mouse_move.md](docs/chapters/respond_to_mouse_move.md)                  |Respond to mouse, minimal example        |Minimal example, mouse move
[code](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_button_press) |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_mouse_button_press/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_mouse_button_press)  |[respond_to_mouse_button_press.md](docs/chapters/respond_to_mouse_button_press.md)  |Respond to mouse, minimal example        |Minimal example, mouse button press
[code](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_turn)   |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_turn/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_turn)      |[respond_to_mouse_wheel_turn.md](docs/chapters/respond_to_mouse_wheel_turn.md)      |Respond to mouse, minimal example        |Minimal example, mouse wheel turn
[code](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_press)  |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_press/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_press)    |[respond_to_mouse_wheel_press.md](docs/chapters/respond_to_mouse_wheel_press.md)    |Respond to mouse, minimal example        |Minimal example, mouse wheel press

- gamepad

### Section 4: media

- Adding a 3D player with a texture
- 3D models
- drawing
- animations
- sounds

### Appendix

Code                                                                                    |Code coverage                                                                                                                                                                                                          |Chapter [2]                                                                         |Description                              |Concepts
----------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|-----------------------------------------|------------------
[code](https://github.com/richelbilderbeek/bevy_tdd_book_move_camera)                   |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_camera/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_camera)                                      |[move_camera.md](docs/chapters/move_camera.md)                                      |Move the camera                          |Extending a Component
[code](https://github.com/richelbilderbeek/bevy_tdd_book_move_camera_with_keyboard)     |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_camera_with_keyboard/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_camera_with_keyboard)          |[move_camera_with_keyboard.md](docs/chapters/move_camera_with_keyboard.md)          |Respond to keyboard                      |.
[code](https://github.com/richelbilderbeek/bevy_tdd_book_move_player_with_keyboard)     |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_player_with_keyboard/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_player_with_keyboard)          |[move_player_with_keyboard.md](docs/chapters/move_player_with_keyboard.md)          |Respond to keyboard                      |.
[code](https://github.com/richelbilderbeek/bevy_tdd_book_move_camera_with_mouse)        |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_camera_with_mouse/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_camera_with_mouse)                |[move_camera_with_mouse.md](docs/chapters/move_camera_with_mouse.md)                |Respond to mouse                         |.
[code](https://github.com/richelbilderbeek/bevy_tdd_book_move_player_with_mouse)        |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_player_with_mouse/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_player_with_mouse)                |[move_player_with_mouse.md](docs/chapters/move_player_with_mouse.md)                |Respond to mouse                         |.
[code](https://github.com/richelbilderbeek/bevy_tdd_book_show_2d_coordinate_systems)    |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_show_2d_coordinate_systems/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_show_2d_coordinate_systems)        |[show_2d_coordinate_systems.md](docs/chapters/show_2d_coordinate_systems.md)        |Show 2D coordinate systems               |2D coordinate systems

## Chapter overview

```mermaid
flowchart TD
  subgraph sub_basics[Basics]
    hello_world[hello_world\nGet started]
    add_player[add_player\nAdd a player]
    add_player_sprite[add_player_sprite\nAdd a player sprite]
    add_camera[add_camera\nAdd a camara]
    move_camera[move_camera\nMove the camera]
    move_player[move_player\nMove the player]
  end
  subgraph sub_user_input[User input]
    respond_to_key_press[respond_to_key_press\nRespond to a\nkey press]
    respond_to_mouse_move[respond_to_mouse_move\nRespond to a\nmouse move]
    respond_to_mouse_button_press[respond_to_mouse_button_press\nRespond to a\nmouse button press]
    respond_to_mouse_wheel_press[respond_to_mouse_wheel_press\nRespond to a\nmouse wheel press]
    respond_to_mouse_wheel_turn[respond_to_mouse_wheel_turn\nRespond to a\nmouse wheel turn]
    respond_to_just_key_pressed[respond_to_just_key_pressed\nRespond to a key\nthat has just been pressed]
    respond_to_window_resize[respond_to_window_resize\nRespond to a window\nthat resizes]
  end
  subgraph sub_appendix[Appendix]
    move_player_keyboard[move_player_keyboard\nMove the player\nusing keyboard]
    move_camera_keyboard[move_camera_keyboard\nMove the camera\nusing keyboard]
    move_player_mouse[move_player_mouse\nMove the player\nusing mouse]
    move_camera_mouse[move_camera_mouse\nMove the camera\nusing mouse]
    show_2d_coordinate_systems[show_2d_coordinate_systems\nShow 2D coordinate\nsystems]
  end

  %% ------------------------
  %% Basic -> Basis
  %% ------------------------
  hello_world --> add_player
  add_player --> add_player_sprite
  add_player_sprite --> move_player
  add_player_sprite --> add_camera
  add_camera --> move_camera
  move_camera -.- |similar\nchapters| move_player

  %% ------------------------
  %% Basics -> User input
  %% ------------------------
  sub_basics --> sub_user_input
  %% add_player_sprite --> respond_to_key_press
  %% add_player_sprite --> respond_to_just_key_pressed
  %% add_player_sprite --> respond_to_mouse_move
  %% add_player_sprite --> respond_to_mouse_button_press
  %% add_player_sprite --> respond_to_mouse_wheel_press
  %% add_player_sprite --> respond_to_mouse_wheel_turn
  %% add_player_sprite --> respond_to_window_resize

  %% ------------------------
  %% User input -> User input
  %% ------------------------

  %%respond_to_key_press --> move_player_keyboard
  %%respond_to_just_key_pressed --> move_player_keyboard

  %% move_camera --> move_camera_keyboard
  %% move_camera --> move_camera_mouse

  %% move_player --> move_player_keyboard
  %% move_player --> move_player_mouse

  %% respond_to_mouse_move --> move_player_mouse
  %% respond_to_mouse_button_press --> move_player_mouse
  %% respond_to_mouse_wheel_press --> move_player_mouse
  %% respond_to_mouse_wheel_turn --> move_player_mouse

  %% respond_to_mouse_move --> move_camera_mouse
  %% respond_to_mouse_button_press --> move_camera_mouse
  %% respond_to_mouse_wheel_press --> move_camera_mouse
  %% respond_to_mouse_wheel_turn --> move_camera_mouse

  %% respond_to_mouse_move --> show_2d_coordinate_systems
  %% respond_to_window_resize --> show_2d_coordinate_systems

  %% ------------------------
  %% User input -> Appendix
  %% ------------------------
  sub_user_input --> sub_appendix

  %% ------------------------
  %% Appendix -> Appendix
  %% ------------------------
  move_camera_keyboard -.- |similar\nchapters| move_player_keyboard
  move_camera_mouse -.- |similar\nchapters| move_player_mouse
```

## Contributors

These can be found at [docs/misc/contributors.md](docs/misc/contributors.md).

## Files used by continuous integration scripts

Filename                              |Descriptions
--------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------
[mlc_config.json](mlc_config.json)    |Configuration of the link checker, use `markdown-link-check --config mlc_config.json --quiet docs/**/*.md` to do link checking locally
[.spellcheck.yml](.spellcheck.yml)    |Configuration of the spell checker, use `pyspelling -c .spellcheck.yml` to do spellcheck locally
[.wordlist.txt](.wordlist.txt)        |Whitelisted words for the spell checker, use `pyspelling -c .spellcheck.yml` to do spellcheck locally
[.markdownlint.jsonc](.markdownlint.jsonc)|Configuration of the markdown linter, use `markdownlint "**/*.md"` to do markdown linting locally. The name of this file is a default name.
[.markdownlintignore](.markdownlintignore)|Files ignored by the markdown linter, use `markdownlint "**/*.md"` to do markdown linting locally. The name of this file is a default name.

## Links

- [Blog post 'Test-Driven Development in Rust Game Development with Bevy' by Edgardo Carreras](https://edgardocarreras.com/blog/tdd-in-rust-game-engine-bevy/)
