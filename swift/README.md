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

1. Create `HelloMessage` class in [HelloMessage.swift](Sources/HelloMessage.swift):

```swift
class HelloMessage {
  var 👋: String {
    get {
      return "Hello World!"
    }
  }
}
```

2. Same way create `HelloConsole` class in [HelloConsole.swift](Sources/HelloConsole.swift):

```swift
class HelloConsole {
  func print(👋: String) {
    Swift.print(👋)
  }
}
```

3. Create `HelloApp` class in [HelloApp.swift](Sources/HelloApp.swift):

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

4. Create main class in [Main.swift](Sources/Main.swift) that wraps it all together:

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

Following [JUnit5 > Writing Tests](https://junit.org/junit5/docs/current/user-guide/#writing-tests), [Mockito > Stubbing](https://javadoc.io/doc/org.mockito/mockito-core/latest/org/mockito/Mockito.html#stubbing) and [AssertJ > Core assertions guide](https://assertj.github.io/doc/#assertj-core-assertions-guide) guides ...

1. Test `HelloMessage` in [HelloMessageTest.java](src/test/java/org/hello/HelloMessageTest.java):

```java
@Test
void shouldReturnHelloWorld() {
  var message = new HelloMessage();
  assertThat(message.getText()).isEqualTo("Hello World!");
}
```

2. Test `HelloApp` in [HelloAppTest.java](src/test/java/org/hello/HelloAppTest.java):

```java
@Test
void shouldPrintHelloMessage() {

  var messageText = "Hello Test!";

  // 2.1 Create a mock of HelloMessage
  var message = mock(HelloMessage.class);
  // 2.2 Return "Hello Test!" whenever getText() is called
  when(message.getText()).thenReturn(messageText);

  // 2.2 Create a mock of HelloConsole
  var console = mock(HelloConsole.class);

  // 2.3 Create a HelloApp, the one we want to test, passing the mocks
  var app = new HelloApp(message, console);
  // 2.4 Execute the method we want to test
  app.printHello();

  // 2.5 Verify HelloConsole mock print() method
  // has been called once with "Hello Test!"
  verify(console).print(messageText);
}
```

3. Test output should look like:

```
> Task :test

HelloAppTest > shouldPrintHelloMessage() PASSED

HelloMessageTest > shouldReturnHelloWorld() PASSED

BUILD SUCCESSFUL in 2s
```

## Run this project using 🐳 [docker](https://www.docker.com/)

- Execute `./docker-run.sh`
- Once inside the container:
  - Test with `./gradlew test --rerun-tasks`
  - Run with `./gradlew run`

## Run this project locally

### Pre-requisites

- Install [Java](https://openjdk.org/) and [Gradle](https://gradle.org/) manually or ...
  - Install [SdkMan](https://sdkman.io/) and ...
    - List available versions executing `sdk list java` and `sdk list gradle`
    - Install **Java** executing `sdk install java 21-tem`
    - Install **Gradle** executing `sdk install grade 8.4`

### Run locally

- Test with `./gradlew test --rerun-tasks`
- Run with `./gradlew run`

### Create project from scratch

- Create project using `gradle init --type java-application --dsl kotlin --test-framework junit-jupiter`
- Add [Mockito](https://site.mockito.org/) and [AssertJ](https://assertj.github.io/doc/) dependencies in [build.gradle.kts](build.gradle.kts):
  ```kotlin
  dependencies {
    testImplementation("org.mockito:mockito-core:x.x.x")
    testImplementation("org.assertj:assertj-core:x.x.x")
  }
  ```




https://www.swift.org/getting-started/cli-swiftpm/

swift package init --name Hello --type executable

https://github.com/apple/swift-testing
https://swiftpackageindex.com/apple/swift-testing/main/documentation/testing/temporarygettingstarted
https://swiftpackageindex.com/apple/swift-testing/main/documentation/testing

https://www.swift.org/packages/testing.html

./.tmp/Cuckoo/Generator/bin/cuckoo_generator generate --testable Hello --output Tests/Mocks.swift Sources/HelloMessage.swift Sources/HelloConsole.swift


swift build -c release
$(swift build --show-bin-path -c release)/Hello
