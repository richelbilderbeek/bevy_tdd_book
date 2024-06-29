# Add player

This chapter shows how to add a player to a game.

The [main.rs](https://github.com/richelbilderbeek/bevy_tdd_book_add_player/blob/master/src/main.rs))
is identical to the [main.rs](https://github.com/richelbilderbeek/bevy_tdd_book_hello_world/blob/master/src/main.rs))
used in a 'Hello world' program.
See [the 'Hello world' chapter](hello_world.md)
for a more in-depth explanation of 'main.rs'.

The action takes place in [app.rs](https://github.com/richelbilderbeek/bevy_tdd_book_add_player/blob/master/src/app.rs).

## First test

First, we test that there is no player in an empty `App`:

```rust
#[test]
fn test_empty_app_has_no_players() {
    let app = App::new();
    assert_eq!(count_n_players(&app), 0);
}
```

The error will be that `count_n_players` is absent.

## First fix

Here is a possible implementation:

```rust
#[cfg(test)]
fn count_n_players(app: &App) -> usize {
    let mut n = 0;
    for c in app.world.components().iter() {
        if c.name().contains("Player") {
            n += 1;
        }
    }
    return n;
}
```

The first line, `#[cfg(test)]`, labels the function to be used in debugging only.

In the function it is counted how often the world components' names
contain (but not match) `Player`.
An exact match for `Player` would fail,
as the world components' names include the crate name too,
for example `add_player::Player`.

This implementation is a simple, but imperfect definition to count the
amount of `Player` components: it will give incorrect results when another
component is added that contains the word `Player`, such as `PlayerHealth`.
However, we should not worry about this: YAGNI ('You Ain't Gonna Need It')
reminds us that we may never need it, and TDD lets us write new tests when
we do need this in the future.

## Second test

Now that we can count the number of players,
there should be a way to add a player.
After adding a player, there should be one player counted:

```rust
#[test]
fn test_setup_player_adds_a_player() {
    let mut app = App::new();
    assert_eq!(count_n_players(&app), 0);
    app.add_systems(Startup, setup_player);
    app.update();
    assert_eq!(count_n_players(&app), 1);
}
```

The error will be that `setup_player` is absent.

The line `app.add_systems(Startup, setup_player)` can be converted to English
as: at the startup phase of the `App`, run the `setup_player` function.
After this, `app.update()` is needed to actually add it.

## Second fix

Here is a possible implementation:

```rust
fn setup_player(mut commands: Commands) {
    commands.spawn(Player);
}
```

This implementation is a simple, but imperfect way to add a player
to an `App`. In the future, we probably want to show the Player
on the screen.
However, we should not worry about this now: TDD lets us write new tests when
we do need this in the future.

## Third test

Now that we can count and create players,
we can test that our `App` starts with one player:

```rust
#[test]
fn test_create_app_has_a_player() {
    let app = create_app();
    assert_eq!(count_n_players(&app), 1);
}
```

This will fail, as `create_app` does not create an `App` with
a player.

## Third fix

The modifications needed in `create_app` are similar to those in the
second test:

```rust
pub fn create_app() -> App {
    let mut app = App::new();
    app.add_systems(Startup, setup_player);
    app.update();
    return app;
}
```

## Conclusion

We can now create an `App` with one player.
When running the `App`, nothing is displayed yet. 
However, we do have tested everything that the App does!

Full code can be found at [https://github.com/richelbilderbeek/bevy_tdd_book_add_player](https://github.com/richelbilderbeek/bevy_tdd_book_add_player).
