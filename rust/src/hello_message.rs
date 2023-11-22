#[cfg(test)]
use mockall::automock;

#[cfg_attr(test, automock)]
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

#[cfg(test)]
mod tests {
  use super::*;

  #[test]
  fn should_return_hello_world() {
    let message = HelloWorldMessage::new();
    assert_eq!(message.text(), String::from("Hello World!"))
  }
}
