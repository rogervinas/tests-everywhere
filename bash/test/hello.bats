setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'

    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR/../src:$PATH"
}

@test "helloMessage should return hello world" {
    source hello-message.bash
    run helloMessage

    assert_output "Hello World!"
}

@test "helloApp should print hello message" {
    function helloMessageMock() {
        echo "Hello Test!"
    }

    function helloConsoleMock() {
        local text=$1
        echo "helloConsoleMock[$text]"
    }

    source hello-app.bash
    run helloApp helloMessageMock helloConsoleMock
    
    assert_output "helloConsoleMock[Hello Test!]"
}

@test "hello.bash should print hello world" {
    run hello.bash

    assert_output "Hello World!"   
}