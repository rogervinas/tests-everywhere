class HelloApp:
    def __init__(self, message, console):
        self.message = message
        self.console = console

    def print_hello(self):
        self.console.print(self.message.text)