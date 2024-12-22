# Functions

This appendix contains functions that are useful in testing.

- [get_all_components_names](#get_all_components_names)
- [print_all_components_names](#print_all_components_names)

## get_all_components_names

```rust
fn get_all_components_names(app: &App) -> Vec<String> {
    use std::str::FromStr;

    let mut v: Vec<String> = Vec::new();
    for c in app.world().components().iter() {
        v.push(String::from_str(c.name()).unwrap());
    }
    return v;
}
```

## print_all_components_names

```rust
fn print_all_components_names(app: &App) {
    for c in app.world().components().iter() {
        println!("{}", c.name())
    }
}
```
