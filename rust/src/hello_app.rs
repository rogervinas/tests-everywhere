use crate::hello_console::HelloConsole;
use crate::hello_message::HelloMessage;

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

#[cfg(test)]
mod tests {
  use super::*;
  use mockall::predicate::*;
  use crate::hello_console::MockHelloConsole;
  use crate::hello_message::MockHelloMessage;

  #[test]
  fn should_print_hello_message() {
    let message_text = "Hello Test!";
    let mut message = MockHelloMessage::new();
    message.expect_text().return_const(String::from(message_text));

    let mut console = MockHelloConsole::new();
    console.expect_print()
      .with(eq(String::from(message_text)))
      .times(1)
      .return_const(());

    let app = HelloApp::new(Box::new(message), Box::new(console));
    app.print_hello();
  }
}