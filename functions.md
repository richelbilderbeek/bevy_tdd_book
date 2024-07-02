# Functions

This appendix contains functions that are useful in testing.

- [get_all_components_names](#get_all_components_names)
- [print_all_components_names](#print_all_components_names)

## get_all_components_names

```rust
fn get_all_components_names(app: &App) -> Vec<String> {
    use std::str::FromStr;

    let mut v: Vec<String> = Vec::new();
    for c in app.world.components().iter() {
        v.push(String::from_str(c.name()).unwrap());
    }
    return v;
}
```

A fresh `App` has 5 Components, after an update it has 7 Components:

```rust
#[test]
fn test_get_all_components_names_for_empty_app() {
    let mut app = App::new();
    let v = get_all_components_names(&app);
    assert_eq!(v.len(), 5);
	/*
	bevy_ecs::schedule::schedule::Schedules
	bevy_ecs::reflect::AppTypeRegistry
	bevy_app::main_schedule::MainScheduleOrder
	bevy_app::main_schedule::FixedMainScheduleOrder
	bevy_ecs::event::Events<bevy_app::app::AppExit>
    */
}
#[test]
fn test_get_all_components_names_for_empty_app() {
    let mut app = App::new();
    app.update();
    let v = get_all_components_names(&app);
    assert_eq!(v.len(), 7);
	/*
	bevy_ecs::schedule::schedule::Schedules
	bevy_ecs::reflect::AppTypeRegistry
	bevy_app::main_schedule::MainScheduleOrder
	bevy_app::main_schedule::FixedMainScheduleOrder
	bevy_ecs::event::Events<bevy_app::app::AppExit>
	bevy_ecs::schedule::stepping::Stepping
	bevy_ecs::event::EventUpdateSignal
	*/
}
```

## print_all_components_names


```rust
fn print_all_components_names(app: &App) {
    for c in app.world.components().iter() {
        println!("{}", c.name())
    }
}
```
