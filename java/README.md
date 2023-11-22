[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/java.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/java.yml)
![Java](https://img.shields.io/badge/Java-21-blue?labelColor=black)

# Java

[Java](https://openjdk.org/) testing with [JUnit5](https://junit.org/junit5/), [Mockito](https://site.mockito.org/) and [AssertJ](https://assertj.github.io/doc/)

- [Show me the code](#show-me-the-code)
  - [Implementation](#implementation)
  - [Test](#test)
- [Run this project using 🐳 docker](#run-this-project-using--docker)
- [Run this project locally](#run-this-project-locally)

## Show me the code

### Implementation

1. Create `HelloMessage` class in [HelloMessage.java](src/main/java/org/hello/HelloApp.java):

```java
public class HelloMessage {
  public String getText() {
    return "Hello World!";
  }
}
```

We can create it as a class as [Mockito](https://site.mockito.org/) is able to mock final classes.

2. Same way create `HelloConsole` class in [HelloConsole.java](src/main/java/org/hello/HelloConsole.java):

```java
public class HelloConsole {
  public void print(String text) {
    System.out.println(text);
  }
}
```

3. Create `HelloApp` class in [HelloApp.java](src/main/java/org/hello/HelloApp.java):

```java
public class HelloApp {

  private final HelloMessage message;
  private final HelloConsole console;

  public HelloApp(HelloMessage message, HelloConsole console) {
    this.message = message;
    this.console = console;
  }

  public void printHello() {
    console.print(message.getText());
  }
}
```

4. Create main class in [Main.java](src/main/java/org/hello/Main.java) that wraps it all together:

```java
public class Main {

  public static void main(String[] args) {
    var message = new HelloMessage();
    var console = new HelloConsole();
    var app = new HelloApp(message, console);
    app.printHello();
  }
}
```

### Test

Following [JUnit5 > Writing Tests](https://junit.org/junit5/docs/current/user-guide/#writing-tests) guide ...

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
  // - Return "Hello Test!" whenever getText() is called
  when(message.getText()).thenReturn(messageText);

  // 2.2 Create a mock of HelloConsole
  var console = mock(HelloConsole.class);

  // 2.3 Create a HelloApp, the one we want to test, passing the mocks
  var app = new HelloApp(message, console);
  // - Execute the method we want to test
  app.printHello();

  // 2.4 Verify HelloConsole mock print() method
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
