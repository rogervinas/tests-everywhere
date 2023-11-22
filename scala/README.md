[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/scala.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/scala.yml)
![Java](https://img.shields.io/badge/Java-21-blue?labelColor=black)
![Scala](https://img.shields.io/badge/Scala-3.3.1-blue?labelColor=black)

# Scala

[Scala](https://www.scala-lang.org/) testing with [ScalaTest](https://www.scalatest.org/) and [Mockito](https://www.scalatest.org/plus/mockito)

- [Show me the code](#show-me-the-code)
  - [Implementation](#implementation)
  - [Test](#test)
- [Run this project using 🐳 docker](#run-this-project-using--docker)
- [Run this project locally](#run-this-project-locally)

## Show me the code

### Implementation

1. Create `HelloMessage` class in [HelloMessage.scala](src/main/scala/org/hello/HelloMessage.scala):

```scala
class HelloMessage:
  def text: String = "Hello World!"
```

We can create it as a class as [Mockito](https://www.scalatest.org/plus/mockito) is able to mock final classes.

2. Same way create `HelloConsole` class in [HelloConsole.scala](src/main/scala/org/hello/HelloConsole.scala):

```scala
class HelloConsole:
  def print(text: String): Unit =
    println(text)
```

3. Create `HelloApp` class in [HelloApp.scala](src/main/scala/org/hello/HelloApp.scala):

```scala
class HelloApp(message: HelloMessage, console: HelloConsole):
  def printHello(): Unit =
    console.print(message.text)
```

4. Create main class in [Main.scala](src/main/scala/org/hello/Main.scala) that wraps it all together:

```scala
@main def main(): Unit =
  val message = HelloMessage()
  val console = HelloConsole()
  val app = HelloApp(message, console)
  app.printHello()
```

### Test

Following [ScalaTest > Writing your first test](https://www.scalatest.org/user_guide/writing_your_first_test) and [ScalaTest + Mockito](https://www.scalatest.org/plus/mockito) guides ...

1. Test `HelloMessage` in [HelloMessageSpec.scala](src/test/scala/org/hello/HelloMessageSpec.scala):

```scala
class HelloMessageSpec extends AnyFlatSpec {

  "A HelloMessage" should "return hello world" in {
    val message = HelloMessage()
    assertResult(message.text) {
      "Hello World!"
    }
  }
}
```

2. Test `HelloApp` in [HelloAppSpec.scala](src/test/scala/org/hello/HelloAppSpec.scala):

```scala
class HelloAppSpec extends AnyFlatSpec {

  "A HelloApp" should "print hello message" in {
    val messageText = "Hello Test!"

    // 2.1 Create a mock of HelloMessage
    val message = mock[HelloMessage]
    // 2.2 Return "Hello Test!" whenever text is called
    when(message.text).thenReturn(messageText)

    // 2.3 Create a mock of HelloConsole
    val console = mock[HelloConsole]

    // 2.4 Create a HelloApp, the one we want to test, passing the mocks
    val app = HelloApp(message, console)
    // 2.5 Execute the method we want to test
    app.printHello()

    // 2.6 Verify HelloConsole mock print() method
    // has been called once with "Hello Test!"
    verify(console).print(messageText)
  }
}
```

3. Test output should look like:

```
[info] HelloMessageSpec:
[info] A HelloMessage
[info] - should return hello world
[info] HelloAppSpec:
[info] A HelloApp
[info] - should print hello message
[info] Run completed in 515 milliseconds.
[info] Total number of tests run: 2
[info] Suites: completed 2, aborted 0
[info] Tests: succeeded 2, failed 0, canceled 0, ignored 0, pending 0
[info] All tests passed.
[success] Total time: 6 s
```

## Run this project using 🐳 [docker](https://www.docker.com/)

- Execute `./docker-run.sh`
- Once inside the container:
  - Test with `sbt test`
  - Run with `sbt run`

## Run this project locally

### Pre-requisites

- Install [Java](https://openjdk.org/) manually or ...
  - Install [SdkMan](https://sdkman.io/) and ...
    - List available versions executing `sdk list java`
- Install [Scala](https://www.scala-lang.org/download/)
  - Install [Coursier](https://get-coursier.io/) and execute `cs install scala:3.3.1`

### Run locally

- Test with `sbt test`
- Run with `sbt run`

### Create project from scratch

- Create project using `sbt new scala/scala3.g8` (⚠️ maybe you get an error with **Java 21** and you'll need **Java 17** just for this step)
- Add [ScalaTest](https://www.scalatest.org/) and [Mockito](https://www.scalatest.org/plus/mockito) dependencies in [build.sbt](build.sbt):

```sbt
libraryDependencies += "org.scalatest" %% "scalatest" % "3.2.17" % Test,
libraryDependencies += "org.scalatestplus" %% "mockito-4-11" % "3.2.17.0" % Test
```

💡 Alternatively you can create a project using [Gradle Scala Application Sample](https://docs.gradle.org/current/samples/sample_building_scala_applications.html)
