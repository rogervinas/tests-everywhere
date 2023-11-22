[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/go.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/go.yml)
![Go](https://img.shields.io/badge/Go-1.21.4-blue?labelColor=black)

# Go

[Go](https://go.dev/) testing with [Standard library](https://pkg.go.dev/testing)

- [Show me the code](#show-me-the-code)
  - [Implementation](#implementation)
  - [Test](#test)
- [Run this project using 🐳 docker](#run-this-project-using--docker)
- [Run this project locally](#run-this-project-locally)

## Show me the code

### Implementation

1. Create `HelloMessage` interface and `HelloWorldMessage` implementation in [HelloMessage.go](HelloMessage.go):

```go
type HelloMessage interface {
    Text() string
}

type HelloWorldMessage struct{}

func (message *HelloWorldMessage) Text() string {
    return "Hello World!"
}
```

Creating it as an interface will allow us to mock it for testing.

2. Same way create `HelloConsole` interface and `HelloSystemConsole` implementation in [HelloConsole.go](HelloConsole.go):

```go
type HelloConsole interface {
    Print(text string)
}

type HelloSystemConsole struct{}

func (console *HelloSystemConsole) Print(text string) {
    fmt.Println(text)
}
```

3. Create `HelloApp` class in [HelloApp.go](HelloApp.go):

```go
type HelloApp struct {
    message HelloMessage
    console HelloConsole
}

func (app *HelloApp) PrintHello() {
    app.console.Print(app.message.Text())
}
```

4. Create main function in [xx](Main.go) that wraps it all together:

```go
func main() {
    message := HelloWorldMessage{}
    console := HelloSystemConsole{}
    app := HelloApp{&message, &console}
    app.PrintHello()
}
```

### Test

Following [Standard library > testing](https://pkg.go.dev/testing) guide ...

1. Test `HelloMessage` in [HelloMessage_test.go](HelloMessage_test.go):

```go
func TestShouldReturnHelloWorld(t *testing.T) {
    messageText := "Hello World!"
    message := HelloWorldMessage{}
    if message.Text() != messageText {
        t.Fatalf("Expected %s but got %s", messageText, message.Text())
    }
}
```

2. Test `HelloApp` in [HelloApp_test.go](HelloApp_test.go):

```go
// 2.1 Define a HelloMessageMock struct that ...
type HelloMessageMock struct {
    text string
}

// ... fullfils HelloMessage interface
func (message *HelloMessageMock) Text() string {
    return message.text
}

// 2.2 Define a HelloConsoleMock that ...
type HelloConsoleMock struct {
    Calls int
    Text  string
}

// ... fullfills HelloConsole interface
func (console *HelloConsoleMock) Print(text string) {
    console.Calls++
    console.Text = text
}

func TestShouldReturnPrintHelloMessage(t *testing.T) {
    // 2.3 Create a HelloMessageMock
    // - It will return "Hello Test!"
    messageText := "Hello Test!"
    message := HelloMessageMock{messageText}

    // 2.4 Create a HelloConsoleMock
    // - It will capture the calls made
    console := HelloConsoleMock{}

    // 2.5 Create a HelloApp, the one we want to test, passing the mocks
    app := HelloApp{&message, &console}
    // - Execute the method we want to test
    app.PrintHello()

    // 2.6 Assert HelloConsoleMock has been called once
    if console.Calls != 1 {
        t.Fatalf("HelloConsole expected calls 1 but got %d", console.Calls)
    }

    // 2.7 Assert HelloConsoleMock has been called with "Hello Test!"
    if console.Text != messageText {
        t.Fatalf("HelloConsole expected text %s but got %s", messageText, console.Text)
    }
}
```

3. Test output should look like:

```
NUnit Adapter 4.2.0.0: Test execution complete
  Passed ShouldPrintHelloMessage [180 ms]
  Passed ShouldReturnHelloWorld [7 ms]

Test Run Successful.
Total tests: 2
     Passed: 2
 Total time: 2.7702 Seconds
```

## Run this project using 🐳 [docker](https://www.docker.com/)

- Execute `./docker-run.sh`
- Once inside the container:
  - Test with `go test -test.v`
  - Run with `go run .`
  - Build with `go build`

## Run this project locally

### Pre-requisites

- Install [Go](https://go.dev/dl/)

### Run locally

- Test with `go test -test.v`
- Run with `go run .`
- Build with `go build`

### Create project from scratch

- Execute `go mod init org.hello/main`
