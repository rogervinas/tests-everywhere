[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/bash.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/bash.yml)
![Bash](https://img.shields.io/badge/Bash-5.2-blue?labelColor=black)

# Bash

[Bash](https://www.gnu.org/software/bash/) testing with [BATS](https://bats-core.readthedocs.io/en/stable/#)

⚠️ This project includes **BATS** git submodules so once you clone the repo you will need to init and update them:

```
git submodule init
git submodule update
```

- [Show me the code](#show-me-the-code)
  - [Implementation](#implementation)
  - [Test](#test)
- [Run this project using 🐳 docker](#run-this-project-using--docker)
- [Run this project locally](#run-this-project-locally)

## Show me the code

### Implementation

1. Create `helloMessage` function in [hello-message.bash](src/hello-message.bash):

```shell
function helloMessage() {
    echo "Hello World!"
}
```

2. Create `helloConsole` function in [hello-console.bash](src/hello-console.bash):

```shell
function helloConsole() {
    local text=$1
    echo "$text"
}
```

3. Create `helloApp` function in [hello-app.bash](src/hello-app.bash):

```shell
function helloApp() {
    local messageFn=$1
    local consoleFn=$2
    $consoleFn "$($messageFn)"
}
```

Note that `helloApp` function receives the two other functions as parameters and just executes them.

4. Create a main script [hello.bash](src/hello.bash) that just loads the 3 required scripts and executes `helloApp` passing `helloMessage` and `helloConsole` functions as parameters:

```shell
source "$(dirname "${BASH_SOURCE[0]}")/hello-message.bash"
source "$(dirname "${BASH_SOURCE[0]}")/hello-console.bash"
source "$(dirname "${BASH_SOURCE[0]}")/hello-app.bash"

helloApp helloMessage helloConsole
```

### Test

Following [BATS Tutorial > Your first test](https://bats-core.readthedocs.io/en/stable/tutorial.html#your-first-test) ...

1. For simplicity create all tests in [hello.bats](test/hello.bats) file

2. Configure current directory and load some helper modules in `setup` function:

```shell
setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'

    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR/../src:$PATH"
}
```

3. Test `helloMessage` function using [assert_output](https://github.com/bats-core/bats-assert#assert_output) helper:

```shell
@test "helloMessage should return hello world" {
    source hello-message.bash
    run helloMessage

    assert_output "Hello World!"
}
```

4. Test `helloApp` function:

```shell
@test "helloApp should print hello message" {
    # 4.1 Create a helloMessage function mock
    # - Will return "Hello Test!"
    function helloMessageMock() {
        echo "Hello Test!"
    }

    # 4.2 Create a helloConsole function mock
    # - Will print parameter passed within "helloConsoleMock[...]"
    function helloConsoleMock() {
        local text=$1
        echo "helloConsoleMock[$text]"
    }

    # 4.3 Load helloApp function, the one we want to test
    source hello-app.bash
    # 4.4 Execute helloApp passing mock functions
    run helloApp helloMessageMock helloConsoleMock

    # Assert helloConsoleMock has been called once
    # with the returned message by helloMessageMock
    assert_output "helloConsoleMock[Hello Test!]"
}
```

5. Test the whole `hello.bash` script too:

```shell
@test "hello.bash should print hello world" {
    run hello.bash

    assert_output "Hello World!"
}
```

6. Test output should look like:

```
hello.bats
 ✓ helloMessage should return hello world
 ✓ helloApp should print hello message
 ✓ hello.bash should print hello world

3 tests, 0 failures
```

Take a look at the other [Libraries and Add-ons](https://bats-core.readthedocs.io/en/stable/writing-tests.html#libraries-and-add-ons) that may be useful in the future. For example, there is a couple of **bats-mock** libraries that can be used to mock programs (but unfortunately not able to mock functions).

## Run this project using 🐳 [docker](https://www.docker.com/)

- Execute `./docker-run.sh`
- Once inside the container:
  - Test with `./test/bats/bin/bats test/hello.bats`
  - Run with `./src/hello.bash`

## Run this project locally

### Pre-requisites

- Ensure you have **bash** installed `bash --version` (this project uses version 5.2)

### Create project from scratch

- Create an empty project with `src` and `test` folders
- Follow [Quick installation](https://bats-core.readthedocs.io/en/stable/tutorial.html#quick-installation) guide to install **BATS** submodules:

```
git submodule add https://github.com/bats-core/bats-core.git test/bats
git submodule add https://github.com/bats-core/bats-support.git test/test_helper/bats-support
git submodule add https://github.com/bats-core/bats-assert.git test/test_helper/bats-assert
```

### Run locally

- Test with `./test/bats/bin/bats test/hello.bats`
- Run with `./src/hello.bash`
