[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/python.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/python.yml)
![Python](https://img.shields.io/badge/Python-3.12-blue?labelColor=black)

# Python

[Python](https://www.python.org/) testing with [unittest](https://docs.python.org/3/library/unittest.html)

- [Show me the code](#show-me-the-code)
  - [Implementation](#implementation)
  - [Test](#test)
- [Run this project using 🐳 docker](#run-this-project-using--docker)
- [Run this project locally](#run-this-project-locally)

## Show me the code

### Implementation

1. Create `HelloMessage` class in [hello_message.py](main/hello_message.py):

```python
class HelloMessage:
  def __init__(self):
    self.text = "Hello World!"
```

2. Create `HelloConsole` class in [hello_console.py](main/hello_console.py):

```python
from builtins import print as __print__

class HelloConsole:
  def print(self, text):
    __print__(text)
```

Note that we have to import `print` system function as `__print__` to avoid conflict with `HelloConsole` own `print` method.

3. Create `HelloApp` class in [hello_app.py](main/hello_app.py):

```python
class HelloApp:
  def __init__(self, message, console):
    self.message = message
    self.console = console

  def print_hello(self):
    self.console.print(self.message.text)
```

4. Create main function in [\_\_main__.py](main/__main__.py) that wraps it all together:

```python
message = HelloMessage()
console = HelloConsole()
app = HelloApp(message, console)
app.print_hello()
```

### Test

Following [unittest > Basic example](https://docs.python.org/3/library/unittest.html#basic-example) and [unittest.mock > Quick Guide](https://docs.python.org/3/library/unittest.mock.html#quick-guide) guides ...

1. Test `HelloMessage` in [test_hello_message.py](test/test_hello_message.py):

```python
class HelloMessageTest(unittest.TestCase):
  def test_should_return_hello_world(self):
    message = HelloMessage()
    self.assertEqual(message.text, "Hello World!")
```

2. Test `HelloApp` in [test_hello_app.py](test/test_hello_app.py):

```python
class HelloAppTest(unittest.TestCase):
  def test_should_print_hello_message(self):
    message_text = "Hello Test!"

    # 2.1 Create a mock of HelloMessage
    message = MagicMock()
    # 2.2 Return "Hello Test!" whenever text is called
    message.text = message_text

    # 2.3 Create a mock of HelloConsole
    console = MagicMock()
    # 2.4 Mock print method
    console.print = MagicMock()

    # 2.5 Create a HelloApp, the one we want to test, passing the mocks
    app = HelloApp(message, console)
    # 2.6 Execute the method we want to test
    app.print_hello()

    # 2.7 Verify HelloConsole mock print() method
    # has been called once with "Hello Test!"
    console.print.assert_called_once_with(message_text)
```

3. Test output should look like:

```
test_should_print_hello_message (test.test_hello_app.HelloAppTest.test_should_print_hello_message) ... ok
test_should_return_hello_world (test.test_hello_message.HelloMessageTest.test_should_return_hello_world) ... ok

----------------------------------------------------------------------
Ran 2 tests in 0.001s

OK
```

## Run this project using 🐳 [docker](https://www.docker.com/)

- Execute `./docker-run.sh`
- Once inside the container:
  - First time only, install dependencies with `bundle install`
  - Test with `python -m unittest discover -v`
  - Run with `python -m main`

## Run this project locally

### Pre-requisites

- Install [Python](https://www.python.org/downloads/) manually or ...
  - Install [pyenv](https://github.com/pyenv/pyenv) version manager and ..
    - List available versions executing `pyenv install -l`
    - Install **Python** executing `pyenv install 3.12` and `pyenv global 3.12`

### Run locally

- Test with `python -m unittest discover -v`
- Run with `python -m main`

### Create project from scratch

- As this project has no external modules required we do not need [requirements.txt](https://pip.pypa.io/en/stable/reference/requirements-file-format/)
- Just a bit of documentation on how to organize our code using [packages](https://docs.python.org/3/tutorial/modules.html#packages)
