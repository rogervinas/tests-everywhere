mod hello_message;
use crate::hello_message::HelloWorldMessage;

mod hello_console;
use crate::hello_console::HelloSystemConsole;

mod hello_app;
use crate::hello_app::HelloApp;

fn main() {
    let message = HelloWorldMessage::new();
    let console = HelloSystemConsole::new();
    let app = HelloApp::new(Box::new(message), Box::new(console));
    app.print_hello();
}
