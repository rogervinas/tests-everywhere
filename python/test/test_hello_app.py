import unittest
from unittest.mock import MagicMock
from main.hello_app import HelloApp


class HelloAppTest(unittest.TestCase):
    def test_should_print_hello_message(self):
        message_text = "Hello Test!"
        message = MagicMock()
        message.text = message_text

        console = MagicMock()
        console.print = MagicMock()

        app = HelloApp(message, console)
        app.print_hello()

        console.print.assert_called_once_with(message_text)


if __name__ == '__main__':
    unittest.main()
