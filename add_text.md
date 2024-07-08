# Add player

This chapter shows how to add a text to a game.

## First test: an `App` has no text

```rust
fn test_empty_app_has_text() {
    let mut app = App::new();
    assert_eq!(count_n_texts(&mut app), 0);
}
```

## Second test: can create an `App` with text

```rust
fn test_can_create_app_from_str() {
    create_app(String::from("irrelevant"));
}
```

## Third test: an `App` has text

```rust
fn test_app_has_text() {
    let mut app = create_app(String::from("irrelevant"));
    app.update();
    assert_eq!(count_n_texts(&mut app), 1);
}
```

## Fourth test: an `App` has the correct text

```rust
fn test_app_uses_text() {
    let text = String::from("some random text");
    let mut app = create_app(text.clone());
    app.update();
    assert_eq!(get_text(&mut app), text);
}
```

## Conclusion

We can now create an `App` with a text.
We have tested everything that the App does!

Full code can be found at [https://github.com/richelbilderbeek/bevy_tdd_book_add_text](https://github.com/richelbilderbeek/bevy_tdd_book_add_text).
