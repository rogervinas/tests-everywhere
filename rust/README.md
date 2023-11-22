[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/rust.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/rust.yml)
![Rust](https://img.shields.io/badge/Rust-1.74.0-blue?labelColor=black)

# Rust

[Rust](https://www.rust-lang.org/) testing with [mockall](https://docs.rs/mockall/latest/mockall/)

- [Show me the code](#show-me-the-code)
  - [Implementation](#implementation)
  - [Test](#test)
- [Run this project using 🐳 docker](#run-this-project-using--docker)
- [Run this project locally](#run-this-project-locally)

## Show me the code

### Implementation

1. Create `HelloMessage` trait and `HelloWorldMessage` implementation in [hello_message.rs](src/hello_message.rs):

```rust
pub trait HelloMessage {
  fn text(&self) -> String;
}

pub struct HelloWorldMessage {}

impl HelloMessage for HelloWorldMessage {
  fn text(&self) -> String {
    return String::from("Hello World!");
  }
}

impl HelloWorldMessage {
  pub fn new() -> Self {
    Self {}
  }
}
```

Creating it as a trait will allow us to mock it for testing.

Note that we create a `HelloWorldMessage::new()` method just as a convention to create new instances, although we could just use `HelloWorldMessage {}`.

2. Same way create `HelloConsole` trait and `HelloSystemConsole` implementation in [hello_console.rs](src/hello_console.rs):

```rust
pub trait HelloConsole {
  fn print(&self, text: String);
}

pub struct HelloSystemConsole {}

impl HelloConsole for HelloSystemConsole {
  fn print(&self, text: String) {
    println!("{}", text);
  }
}

impl HelloSystemConsole {
  pub fn new() -> Self {
    Self {}
  }
}
```

3. Create `HelloApp` class in [hello_app.rs](src/hello_app.rs):

```rust
pub struct HelloApp {
  message: Box<dyn HelloMessage>,
  console: Box<dyn HelloConsole>
}

impl HelloApp {
  pub fn new(message: Box<dyn HelloMessage>, console: Box<dyn HelloConsole>) -> Self {
    Self { message, console }
  }

  pub fn print_hello(&self) {
    self.console.print(self.message.text());
  }
}
```

Note that we pass constructor arguments as `Box<dyn T>` to avoid `doesn't have a size known at compile-time` compilation error.

4. Create main function in [main.rs](src/main.rs) that wraps it all together:

```rust
fn main() {
  let message = HelloWorldMessage::new();
  let console = HelloSystemConsole::new();
  let app = HelloApp::new(Box::new(message), Box::new(console));
  app.print_hello();
}
```

### Test

Following [Rust By Example > Unit testing](https://doc.rust-lang.org/rust-by-example/testing/unit_testing.html) and [mockall > Getting Started](https://docs.rs/mockall/latest/mockall/#getting-started) guides ...

1. Test `HelloMessage` in [hello_message.rs](src/hello_message.rs):

```rust
#[cfg(test)]
mod tests {
  use super::*;

  #[test]
  fn should_return_hello_world() {
    let message = HelloWorldMessage::new();
    assert_eq!(message.text(), String::from("Hello World!"))
  }
}
```

2. Setup `HelloMessage` mocking needed by `HelloApp` test in [hello_message.rs](src/hello_message.rs):

```rust
// 2.1 Enable automock
#[cfg(test)]
use mockall::automock;

// 2.2 Enable automock for HelloMessage
#[cfg_attr(test, automock)]
pub trait HelloMessage {
  fn text(&self) -> String;
}
```

3. Setup `HelloConsole` mocking needed by `HelloApp` test in [hello_console.rs](src/hello_console.rs):

```rust
// 3.1 Enable automock
#[cfg(test)]
use mockall::automock;

// 3.2 Enable automock for HelloConsole
#[cfg_attr(test, automock)]
pub trait HelloConsole {
  fn print(&self, text: String);
}
```

4. Test `HelloApp` in [hello_app.rs](src/hello_app.rs):

```rust
#[cfg(test)]
mod tests {
  use super::*;
  use mockall::predicate::*;
  // 4.1 Use MockHelloMessage, enabled by 2.2
  use crate::hello_message::MockHelloMessage;
  // 4.2 Use MockHelloConsole, enabled by 3.2
  use crate::hello_console::MockHelloConsole;

  #[test]
  fn should_print_hello_message() {
    let message_text = "Hello Test!";

    // 4.3 Create a mock of HelloMessage
    let mut message = MockHelloMessage::new();
    // - Return "Hello Test!" whenever text is called
    message.expect_text().return_const(String::from(message_text));

    // 2.2 Create a mock of HelloConsole
    let mut console = MockHelloConsole::new();
    // 2.3 Expect print to be called once with "Hello Test!"
    console.expect_print()
      .with(eq(String::from(message_text)))
      .times(1)
      .return_const(());

    // 2.4 Create a HelloApp, the one we want to test, passing the mocks
    let app = HelloApp::new(Box::new(message), Box::new(console));
    // - Execute the method we want to test
    app.print_hello();

    // Expectation 2.3 will be checked once test ends
  }
}
```

3. Test output should look like:

```
running 2 tests
test hello_app::tests::should_print_hello_message ... ok
test hello_message::tests::should_return_hello_world ... ok

test result: ok. 2 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s
```

## Run this project using 🐳 [docker](https://www.docker.com/)

- Execute `./docker-run.sh`
- Once inside the container:
  - First time only, install dependencies with `bundle install`
  - Test with `cargo test`
  - Run with `cargo run`
  - Build with `cargo build`

## Run this project locally

### Pre-requisites

- Install [Rustup](https://www.rust-lang.org/tools/install) manually and ...
  - List active toolchain installed executing `rustup show`
  - List [Cargo](https://doc.rust-lang.org/cargo/) version installed executing `cargo --version`

### Run locally

- Test with `cargo test`
- Run with `cargo run`
- Build with `cargo build`

### Create project from scratch

- Create project with `cargo new <project-name>`
- Install [mockall](https://docs.rs/mockall/latest/mockall/) dependency with `cargo add mockall --dev`
