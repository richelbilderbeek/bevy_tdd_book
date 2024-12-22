# bevy_tdd_book

<!-- markdownlint-disable MD013 -->

[![Check chapters](https://github.com/richelbilderbeek/bevy_tdd_book/actions/workflows/check_chapters.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book/actions/workflows/check_chapters.yaml)
[![Check links](https://github.com/richelbilderbeek/bevy_tdd_book/actions/workflows/check_links.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book/actions/workflows/check_links.yaml)
[![Check markdown](https://github.com/richelbilderbeek/bevy_tdd_book/actions/workflows/check_markdown.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book/actions/workflows/check_markdown.yaml)
[![Check spelling](https://github.com/richelbilderbeek/bevy_tdd_book/actions/workflows/check_spelling.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book/actions/workflows/check_spelling.yaml)

<!-- markdownlint-enable MD013 -->

Start of a book [1] called 'Developing Bevy games using TDD'.
The goal is to demonstrate how to do Test-Driven Development with Bevy.

- [Contributing](CONTRIBUTING.md)
- [Contributors](docs/misc/contributors.md)
- [FAQ](docs/misc/faq.md)

## Chapters

### Section 1: introduction

- [1.1. Introduction](docs/introduction/introduction.md)

### Section 2: basics

- [2.1. Introduction](docs/misc/basic_introduction.md)

<!-- markdownlint-disable MD013 -->

Code                                                                                    |Build status                                                                                                                                                                                                                                                                       |Code coverage                                                                                                                                                                                                          |Chapter [2]
-----------|-----------|-----------|------------------------------
[code](https://github.com/richelbilderbeek/bevy_tdd_book_hello_world)                   |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_hello_world/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_hello_world/actions/workflows/check_build.yaml)                                       |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_hello_world/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_hello_world)                                      |[hello_world.md](hello_world.md)
[code](https://github.com/richelbilderbeek/bevy_tdd_book_add_player)                    |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_add_player/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_add_player/actions/workflows/check_build.yaml)                                         |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_player/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_player)                                        |[add_player.md](add_player.md)
[code](https://github.com/richelbilderbeek/bevy_tdd_book_add_player_sprite)             |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_add_player_sprite/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_add_player_sprite/actions/workflows/check_build.yaml)                           |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_player_sprite/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_player_sprite)                          |[add_player_sprite.md](add_player_sprite.md)
[code](https://github.com/richelbilderbeek/bevy_tdd_book_add_player_sprite_with_texture)|[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_add_player_sprite_with_texture/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_add_player_sprite_with_texture/actions/workflows/check_build.yaml) |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_player_sprite_with_texture/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_player_sprite_with_texture)|[add_player_sprite_with_texture.md](add_player_sprite_with_texture.md)
[code](https://github.com/richelbilderbeek/bevy_tdd_book_add_text)                      |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_add_text/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_add_text/actions/workflows/check_build.yaml)                                             |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_text/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_text)                                            |[add_camera.md](add_camera.md)
[code](https://github.com/richelbilderbeek/bevy_tdd_book_add_camera)                    |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_add_camera/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_add_camera/actions/workflows/check_build.yaml)                                         |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_camera/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_add_camera)                                        |[add_camera.md](add_camera.md)
[code](https://github.com/richelbilderbeek/bevy_tdd_book_move_player)                   |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_move_player/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_move_player/actions/workflows/check_build.yaml)                                       |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_player/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_player)                                      |[move_player.md](move_player.md)

<!-- markdownlint-enable MD013 -->

### Section 3: user input

- [3.1. Introduction](docs/misc/respond_to_input_introduction.md)

<!-- markdownlint-disable MD013 -->

Code                                                                                    |Build status                                                                                                                                                                                                                                                                       |Code coverage                                                                                                                                                                                                          |Chapter [2]
-----------|-----------|-----------|------------------------------
[code](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_window_resize)      |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_window_resize/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_window_resize/actions/workflows/check_build.yaml)             |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_window_resize/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_window_resize)            |[respond_to_window_resize.md](respond_to_window_resize.md)
[code](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_key_press)          |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_key_press/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_key_press/actions/workflows/check_build.yaml)                     |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_key_press/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_key_press)                    |[respond_to_key_press.md](respond_to_key_press.md)
[code](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_just_key_pressed)   |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_just_key_pressed/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_just_key_pressed/actions/workflows/check_build.yaml)       |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_just_key_pressed/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_just_key_pressed)      |[respond_to_just_key_pressed.md](respond_to_just_key_pressed.md)
[code](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_move)         |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_move/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_move/actions/workflows/check_build.yaml)                   |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_mouse_move/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_mouse_move)                  |[respond_to_mouse_move.md](respond_to_mouse_move.md)
[code](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_button_press) |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_button_press/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_button_press/actions/workflows/check_build.yaml)   |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_mouse_button_press/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_mouse_button_press)  |[respond_to_mouse_button_press.md](respond_to_mouse_button_press.md)
[code](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_turn)   |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_turn/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_turn/actions/workflows/check_build.yaml)       |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_turn/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_turn)      |[respond_to_mouse_wheel_turn.md](respond_to_mouse_wheel_turn.md)
[code](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_press)  |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_press/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_press/actions/workflows/check_build.yaml)     |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_press/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_respond_to_mouse_wheel_press)    |[respond_to_mouse_wheel_press.md](respond_to_mouse_wheel_press.md)

<!-- markdownlint-enable MD013 -->

- gamepad


### Section 4: media

- Adding a 3D player with a texture
- 3D models
- drawing
- animations
- sounds
- other suggestions from feedback

### Section 99: Graphical user interface testing

- Testing for a key press to close the game

### Section for possible chapters

<!-- markdownlint-disable MD013 -->

Code                                                                                    |Build status                                                                                                                                                                                                                                                                       |Code coverage                                                                                                                                                                                                          |Chapter [2]
-----------|-----------|-----------|------------------------------
[code](https://github.com/richelbilderbeek/bevy_tdd_book_use_game_state)   |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_use_game_state/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_use_game_state/actions/workflows/check_build.yaml)   |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_use_game_state/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_use_game_state)          |[respond_to_mouse_button_press.md](respond_to_mouse_button_press.md)
[code](https://github.com/richelbilderbeek/bevy_tdd_book_use_resources)    |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_use_resources/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_use_resources/actions/workflows/check_build.yaml)   |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_use_resources/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_use_resources)              |[respond_to_mouse_button_press.md](respond_to_mouse_button_press.md)
[code](https://github.com/richelbilderbeek/bevy_tdd_book_use_window_title) |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_use_window_title/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_use_window_title/actions/workflows/check_build.yaml)   |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_use_window_title/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_use_window_title)  |[respond_to_mouse_button_press.md](respond_to_mouse_button_press.md)
[code](https://github.com/richelbilderbeek/bevy_tdd_book_click_sprite)     |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_click_sprite/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_click_sprite/actions/workflows/check_build.yaml)   |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_click_sprite/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_click_sprite)                  |[respond_to_mouse_button_press.md](respond_to_mouse_button_press.md)

<!-- markdownlint-enable MD013 -->

### Appendix

<!-- markdownlint-disable MD013 -->

Code                                                                                    |Build status                                                                                                                                                                                                                                                                       |Code coverage                                                                                                                                                                                                          |Chapter [2]
-----------|-----------|-----------|------------------------------
[code](https://github.com/richelbilderbeek/bevy_tdd_book_move_camera)                |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_move_camera/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_move_camera/actions/workflows/check_build.yaml)                                       |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_camera/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_camera)                                      |[move_camera.md](move_camera.md)
[code](https://github.com/richelbilderbeek/bevy_tdd_book_move_camera_with_keyboard)  |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_move_camera_with_keyboard/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_move_camera_with_keyboard/actions/workflows/check_build.yaml)   |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_camera_with_keyboard/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_camera_with_keyboard)  |[respond_to_mouse_button_press.md](respond_to_mouse_button_press.md)
[code](https://github.com/richelbilderbeek/bevy_tdd_book_move_player_with_keyboard)  |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_move_player_with_keyboard/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_move_player_with_keyboard/actions/workflows/check_build.yaml)           |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_player_with_keyboard/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_player_with_keyboard)          |[move_player_with_keyboard.md](move_player_with_keyboard.md)
[code](https://github.com/richelbilderbeek/bevy_tdd_book_move_camera_with_mouse)     |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_move_camera_with_mouse/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_move_camera_with_mouse/actions/workflows/check_build.yaml)   |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_camera_with_mouse/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_camera_with_mouse)  |[respond_to_mouse_button_press.md](respond_to_mouse_button_press.md)
[code](https://github.com/richelbilderbeek/bevy_tdd_book_move_player_with_mouse)     |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_move_player_with_mouse/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_move_player_with_mouse/actions/workflows/check_build.yaml)   |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_player_with_mouse/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_move_player_with_mouse)  |[respond_to_mouse_button_press.md](respond_to_mouse_button_press.md)
[code](https://github.com/richelbilderbeek/bevy_tdd_book_show_2d_coordinate_systems) |[![Check build](https://github.com/richelbilderbeek/bevy_tdd_book_show_2d_coordinate_systems/actions/workflows/check_build.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book_show_2d_coordinate_systems/actions/workflows/check_build.yaml)   |[![codecov](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_show_2d_coordinate_systems/graph/badge.svg?token=XAVFZYDQKZ)](https://codecov.io/gh/richelbilderbeek/bevy_tdd_book_show_2d_coordinate_systems)  |[respond_to_mouse_button_press.md](respond_to_mouse_button_press.md)

<!-- markdownlint-enable MD013 -->

## Files used by continuous integration scripts

<!-- markdownlint-disable MD013 -->

Filename                                  |Descriptions
------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------
[mlc_config.json](mlc_config.json)        |Configuration of the link checker, use `markdown-link-check --config mlc_config.json --quiet docs/**/*.md` to do link checking locally
[.spellcheck.yml](.spellcheck.yml)        |Configuration of the spell checker, use `pyspelling -c .spellcheck.yml` to do spellcheck locally
[.wordlist.txt](.wordlist.txt)            |Whitelisted words for the spell checker, use `pyspelling -c .spellcheck.yml` to do spellcheck locally
[.markdownlint.jsonc](.markdownlint.jsonc)|Configuration of the markdown linter, use `markdownlint "**/*.md"` to do markdown linting locally. The name of this file is a default name.
[.markdownlintignore](.markdownlintignore)|Files ignored by the markdown linter, use `markdownlint "**/*.md"` to do markdown linting locally. The name of this file is a default name.

<!-- markdownlint-enable MD013 -->

## Links

- [Blog post 'Test-Driven Development in Rust Game Development with Bevy' by Edgardo Carreras](https://edgardocarreras.com/blog/tdd-in-rust-game-engine-bevy/)
