[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/java.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/java.yml)
![Java](https://img.shields.io/badge/Java-21-blue?labelColor=black)

# Java

[Java](https://openjdk.org/) testing with [JUnit5](https://junit.org/junit5/), [Mockito](https://site.mockito.org/) and [AssertJ](https://assertj.github.io/doc/)

## Run this project using 🐳 [docker](https://www.docker.com/)
* Go to [java](java) folder
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
* Go to [java](java) folder
* Test with `./gradlew test`
* Run with `./gradlew run`

### Create project from scratch
* Create project using `gradle init --type java-application --dsl kotlin --test-framework junit-jupiter`
* Add [Mockito](https://site.mockito.org/) and [AssertJ](https://assertj.github.io/doc/) dependencies in [build.gradle.kts](java/build.gradle.kts):
    * `testImplementation("org.mockito:mockito-core:x.x.x")`
    * `testImplementation("org.assertj:assertj-core:x.x.x")`
