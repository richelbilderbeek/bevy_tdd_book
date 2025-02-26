# 2.1. Introduction

In this section, we start building simple Bevy programs,
using test-driven development and gradually introducing
Bevy terminology.

Here you can see the recommended reading order of chapters:

```mermaid
flowchart TD
  introduction[2.1.Introduction: This chapter]
  hello_world[2.2.hello_world: Get started]
  add_player[2.3.add_player: Add a player]
  add_player_sprite[2.4.add_player_sprite: Add a player sprite]
  add_player_sprite_with_texture[2.5.add_player_sprite_with_texture: Add a player sprite with a texture]
  add_camera[2.6.add_camera: Add a camara]
  move_player[2.7.move_player: Move the player]
  add_text[2.8.add_text: Add text]
  move_camera[move_camera: Move the camera]

  introduction --> hello_world
  hello_world --> add_player
  add_player --> add_player_sprite
  add_player_sprite --> add_player_sprite_with_texture
  add_player_sprite_with_texture --> add_text
  add_player_sprite_with_texture --> add_camera
  add_player_sprite --> move_player
  move_player -.-> |optional| move_camera
```

The last chapter `move_camera` is an optional chapter
and part of the appendix,
as it introduces no new concepts.
