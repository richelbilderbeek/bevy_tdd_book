# Add player sprite with a texture

This chapter shows how to add a player sprite with a texture to a game.


## First test

```rust
#[test]
fn test_player_has_a_texture() {
    let mut app = create_app(create_default_game_parameters());
    app.update();
    assert!(get_player_has_texture(&mut app));
}
```

## Conclusion

We can now create an `App` with one player sprite that,
where the player has, among others, a position, scale and a texture.
When running the `App`, we can see the player.
We do tested everything that the App does!

Full code can be found at [https://github.com/richelbilderbeek/bevy_tdd_book_add_player_sprite_with_texture](https://github.com/richelbilderbeek/bevy_tdd_book_add_player_sprite_with_texture).
