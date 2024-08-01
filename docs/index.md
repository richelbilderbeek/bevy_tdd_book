# Welcome to 'Developing Bevy games using TDD'

Start of a book [1] called 'Developing Bevy games using TDD'.
The goal is to demonstrate how to do Test-Driven Development with Bevy.

![](assets/ferris.png)

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

## Footnotes

- [1] 'book' is an overstatement for now: it is just a collection of notes

