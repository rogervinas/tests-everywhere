import unittest
from main.hello_message import HelloMessage


class HelloMessageTest(unittest.TestCase):
  def test_should_return_hello_world(self):
    message = HelloMessage()
    self.assertEqual(message.text, "Hello World!")


if __name__ == '__main__':
  unittest.main()
