[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/kotlin.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/kotlin.yml)
![Java](https://img.shields.io/badge/Java-21-blue?labelColor=black)
![Kotlin](https://img.shields.io/badge/Kotlin-1.9.20-blue?labelColor=black)

# Kotlin

[Kotlin](https://kotlinlang.org/) testing with [Kotest](https://kotest.io) and [MockK](https://mockk.io/)

## Run this project using 🐳 [docker](https://www.docker.com/)
* Execute `./docker-run.sh`
* Once inside the container:
  * Test with `./gradlew test`
  * Run with `./gradlew run`

## Run this project locally

### Pre-requisites
* Install [Java](https://openjdk.org/) and [Gradle](https://gradle.org/) manually or ...
  * Install [SdkMan](https://sdkman.io/) and ...
    * List available versions executing `sdk list java` and `sdk list gradle`
    * Install **Java** executing `sdk install java 21-tem`
    * Install **Gradle** executing `sdk install grade 8.4`

### Run locally
* Go to [kotlin](kotlin) folder
* Test with `./gradlew test`
* Run with `./gradlew run`

### Create project from scratch
* Create project using `gradle init --type kotlin-application --dsl kotlin --test-framework kotlintest`
* Add [Kotest](https://kotest.io) and [MockK](https://mockk.io/) dependencies in [build.gradle.kts](build.gradle.kts):
  ```kotlin
  dependencies {
    testImplementation("io.kotest:kotest-runner-junit5:x.x.x")
    testImplementation("io.mockk:mockk:x.x.x")
  }
  ```
