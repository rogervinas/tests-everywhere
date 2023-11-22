[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/kotlin.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/kotlin.yml)
![Java](https://img.shields.io/badge/Java-21-blue?labelColor=black)
![Kotlin](https://img.shields.io/badge/Kotlin-1.9.20-blue?labelColor=black)

# Kotlin

[Kotlin](https://kotlinlang.org/) testing with [Kotest](https://kotest.io) and [MockK](https://mockk.io/)

- [Show me the code](#show-me-the-code)
  - [Implementation](#implementation)
  - [Test](#test)
- [Run this project using 🐳 docker](#run-this-project-using--docker)
- [Run this project locally](#run-this-project-locally)

## Show me the code

### Implementation

1. Create `HelloMessage` class in [HelloMessage.kt](src/main/kotlin/org/hello/HelloMessage.kt):

```kotlin
class HelloMessage {
  val text: String = "Hello World!"
}
```

We can create it as a class as [MockK](https://mockk.io/) is able to mock final classes.

2. Same way create `HelloConsole` class in [HelloConsole.kt](src/main/kotlin/org/hello/HelloConsole.kt):

```kotlin
class HelloConsole {
  fun print(text: String) {
    println(text)
  }
}
```

3. Create `HelloApp` class in [HelloApp.kt](src/main/kotlin/org/hello/HelloApp.kt):

```kotlin
class HelloApp(private val message: HelloMessage, private val console: HelloConsole) {
  fun printHello() {
    console.print(message.text)
  }
}
```

4. Create main class in [Main.kt](src/main/kotlin/org/hello/Main.kt) that wraps it all together:

```kotlin
fun main() {
  val message = HelloMessage()
  val console = HelloConsole()
  val app = HelloApp(message, console)
  app.printHello()
}
```

### Test

Following [Kotest > Writing Tests](https://kotest.io/docs/framework/writing-tests.html) and [MockK](https://mockk.io/#class-mock) guides ...

1. Test `HelloMessage` in [HelloMessageTest.kt](src/test/kotlin/org/hello/HelloMessageTest.kt):

```kotlin
class HelloMessageTest : DescribeSpec({

  describe("HelloMessage") {
    it("should return hello world") {
      val message = HelloMessage()
      message.text shouldBe "Hello World!"
    }
  }
})
```

2. Test `HelloApp` in [HelloAppTest.kt](src/test/kotlin/org/hello/HelloAppTest.kt):

```kotlin
class HelloAppTest : DescribeSpec({

  describe("HelloApp") {
    it("should print hello message") {
      val messageText = "Hello Test!"

      // 2.1 Create a mock of HelloMessage
      val message = mockk<HelloMessage>()
      // - Return "Hello Test!" whenever text is called
      every { message.text } returns (messageText)

      // 2.2 Create a mock of HelloConsole
      val console = mockk<HelloConsole>()
      // - Do nothing whenever print is called
      every { console.print(any()) } just Runs

      // 2.3 Create a HelloApp, the one we want to test, passing the mocks
      val app = HelloApp(message, console)
      // - Execute the method we want to test
      app.printHello()

      // 2.4 Verify HelloConsole mock print() method
      // has been called once with "Hello Test!"
      verify { console.print(messageText) }
    }
  }
})
```

3. Test output should look like:

```
> Task :test

org.hello.HelloAppTest > HelloApp > should print hello message PASSED

org.hello.HelloMessageTest > HelloMessage > should return hello world PASSED

BUILD SUCCESSFUL in 3s
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

- Go to [kotlin](kotlin) folder
- Test with `./gradlew test --rerun-tasks`
- Run with `./gradlew run`

### Create project from scratch

- Create project using `gradle init --type kotlin-application --dsl kotlin --test-framework kotlintest`
- Add [Kotest](https://kotest.io) and [MockK](https://mockk.io/) dependencies in [build.gradle.kts](build.gradle.kts):
  ```kotlin
  dependencies {
    testImplementation("io.kotest:kotest-runner-junit5:x.x.x")
    testImplementation("io.mockk:mockk:x.x.x")
  }
  ```
