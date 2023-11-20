#[cfg(test)]
use mockall::automock;

#[cfg_attr(test, automock)]
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