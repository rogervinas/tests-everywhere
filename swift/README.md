[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/swift.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/swift.yml)
![Swift](https://img.shields.io/badge/Swift-5.9-blue?labelColor=black)

# Swift

[Swift](https://www.swift.org/) testing with [XCTest](https://developer.apple.com/documentation/xctest) and [Cuckoo](https://github.com/Brightify/Cuckoo)

- [Show me the code](#show-me-the-code)
  - [Implementation](#implementation)
  - [Test](#test)
- [Run this project using 🐳 docker](#run-this-project-using--docker)
- [Run this project locally](#run-this-project-locally)

## Show me the code

### Implementation

Sorry but reading that [constant and variable names can contain almost any character, including Unicode characters](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics#Naming-Constants-and-Variables) I could not resist 😅 ...

#### 1. Create `HelloMessage` class in [HelloMessage.swift](Sources/HelloMessage.swift):

```swift
class HelloMessage {
  var 👋: String {
    get {
      return "Hello World!"
    }
  }
}
```

#### 2. Same way create `HelloConsole` class in [HelloConsole.swift](Sources/HelloConsole.swift):

```swift
class HelloConsole {
  func print(👋: String) {
    Swift.print(👋)
  }
}
```

#### 3. Create `HelloApp` class in [HelloApp.swift](Sources/HelloApp.swift):

```swift
class HelloApp {

  let message: HelloMessage
  let console: HelloConsole

  init(message: HelloMessage, console: HelloConsole) {
    self.message = message
    self.console = console
  }

  func printHello() {
    console.print(👋: message.👋)
  }
}
```

#### 4. Create main class in [Main.swift](Sources/Main.swift) that wraps it all together:

```swift
@main
public struct Main {
  public static func main() {
    let message = HelloMessage()
    let console = HelloConsole()
    let app = HelloApp(message: message, console: console)
    app.printHello()
  }
}
```

### Test

Following [XCTest](https://developer.apple.com/documentation/xctest) and [Cuckoo](https://github.com/Brightify/Cuckoo) guides ...

#### 1. Mock generation

Mocks have to be generated statically, you can follow [these instructions](https://github.com/Brightify/Cuckoo/tree/master#swift-package-manager) or alternatively:

- Build generator (only once, [XCode command line tools](https://developer.apple.com/xcode/resources/) required):
```shell
git clone git@github.com:Brightify/Cuckoo.git /tmp/Cuckoo
/tmp/Cuckoo/build_generator
```

- Generate mocks (as many times as needed):
```shell
/tmp/Cuckoo/Generator/bin/cuckoo_generator generate \
  --testable Hello \
  --output Tests/Mocks.swift \
  Sources/HelloMessage.swift \
  Sources/HelloConsole.swift
```

You can also integrate mocks generation in the build, before compile phase.

#### 2. Test `HelloMessage` in [HelloMessageTest.swift](Tests/HelloMessageTest.swift):

```swift
final class HelloMessageTest: XCTestCase {
  func testHelloMessageShouldReturnHelloWorld() throws {
    let message = HelloMessage()
    XCTAssertEqual(message.👋, "Hello World!")
  }
}
```

#### 3. Test `HelloApp` in [HelloAppTest.swift](Tests/HelloAppTest.swift):

```swift
final class HelloAppTest: XCTestCase {
  func testHelloAppShouldDisplayHelloMessage() throws {
    let messageText = "Hello Test!"
    // 2.1 Create a mock of HelloMessage
    let message = MockHelloMessage()
    // 2.2 Return "Hello Test!" whenever 👋 getter is called
    stub(message) { stub in
      when(stub.👋.get).thenReturn(messageText)
    }

    // 2.2 Create a mock of HelloConsole
    let console = MockHelloConsole()
    // 2.3 Do nothing whenever print is called
    stub(console) { stub in
      when(stub.print(👋: anyString())).thenDoNothing()
    }

    // 2.4 Create a HelloApp, the one we want to test, passing the mocks
    let app = HelloApp(message: message, console: console)
    // 2.5 Execute the method we want to test
    app.printHello()

    // 2.6 Verify HelloConsole mock print() method
    // has been called once with "Hello Test!"
    verify(console).print(👋: messageText)
  }
}
```

#### 4. Test output should look like:

```
Test Suite 'All tests' started at 2023-12-12 16:48:21.225
Test Suite 'debug.xctest' started at 2023-12-12 16:48:21.227
Test Suite 'HelloAppTest' started at 2023-12-12 16:48:21.227
Test Case 'HelloAppTest.testHelloAppShouldDisplayHelloMessage' started at 2023-12-12 16:48:21.227
Test Case 'HelloAppTest.testHelloAppShouldDisplayHelloMessage' passed (0.003 seconds)
Test Suite 'HelloAppTest' passed at 2023-12-12 16:48:21.230
    Executed 1 test, with 0 failures (0 unexpected) in 0.003 (0.003) seconds
Test Suite 'HelloMessageTest' started at 2023-12-12 16:48:21.230
Test Case 'HelloMessageTest.testHelloMessageShouldReturnHelloWorld' started at 2023-12-12 16:48:21.231
Test Case 'HelloMessageTest.testHelloMessageShouldReturnHelloWorld' passed (0.001 seconds)
Test Suite 'HelloMessageTest' passed at 2023-12-12 16:48:21.232
    Executed 1 test, with 0 failures (0 unexpected) in 0.001 (0.001) seconds
Test Suite 'debug.xctest' passed at 2023-12-12 16:48:21.232
    Executed 2 tests, with 0 failures (0 unexpected) in 0.004 (0.004) seconds
Test Suite 'All tests' passed at 2023-12-12 16:48:21.232
    Executed 2 tests, with 0 failures (0 unexpected) in 0.004 (0.004) seconds
```

## Run this project using 🐳 [docker](https://www.docker.com/)

- Execute `./docker-run.sh`
- Once inside the container:
  - Test with `swift test`
  - Run with `swift run`
  - Build with `swift build -c release`
  - Run executable with `$(swift build --show-bin-path -c release)/Hello`

## Run this project locally

### Pre-requisites

- Install [Swift](https://www.swift.org/install/)
- If you need to build [Cuckoo](https://github.com/Brightify/Cuckoo) mock generator, install [XCode command line tools](https://developer.apple.com/xcode/resources/)

### Run locally

- Test with `swift test`
- Run with `swift run`
- Build with `swift build -c release`
- Run executable with `$(swift build --show-bin-path -c release)/Hello`

### Create project from scratch

- Create project using `swift package init --name Hello --type executable`
- Customize [Package.swift](Package.swift):
    - Add `Cuckoo` package as a dependency
    - Add `HelloTests` testTarget with `Hello` and `Cuckoo` dependencies
