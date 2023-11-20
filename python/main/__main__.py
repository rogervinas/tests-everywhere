from main.hello_message import HelloMessage
from main.hello_console import HelloConsole
from main.hello_app import HelloApp

message = HelloMessage()
console = HelloConsole()
app = HelloApp(message, console)
app.print_hello()
