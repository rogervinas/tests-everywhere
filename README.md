# Tests, Tests Everywhere!

![Meme](.files/meme.jpg)

## Java

[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/java.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/java.yml)
![Java](https://img.shields.io/badge/Java-21-blue?labelColor=black)

Java testing with [JUnit5](https://junit.org/junit5/), [Mockito](https://site.mockito.org/) and [AssertJ](https://assertj.github.io/doc/)

### Pre-requisites
* Install [Java](https://openjdk.org/) and [Gradle](https://gradle.org/) manually or ...
  * Install [SdkMan](https://sdkman.io/) and ...
    * Install **Java** using `sdk install java 21-tem` (use `sdk list java` to see all versions)
    * Install **Gradle** using `sdk install grade 8.4` (use `sdk list gradle` to see all versions) 

### Create project from scratch
* Create project using `gradle init --type java-application --test-framework junit-jupiter`
* Add required dependencies in `build.gradle.kts`:
  * `testImplementation("org.mockito:mockito-core:x.x.x")`
  * `testImplementation("org.assertj:assertj-core:x.x.x")`

### Run this project
* Test with `./gradlew test`
* Run with `./gradlew run`

## Kotlin

[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/kotlin.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/kotlin.yml)
![Java](https://img.shields.io/badge/Java-21-blue?labelColor=black)
![Kotlin](https://img.shields.io/badge/Kotlin-1.9.20-blue?labelColor=black)

Using:
* [Kotest](https://kotest.io)
* [MockK](https://mockk.io/)

## JavaScript

[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/javascript.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/javascript.yml)
![Node](https://img.shields.io/badge/Node-18.x-blue?labelColor=black)

JavaScript testing with [Jest](https://jestjs.io/)

### Pre-requisites
* Install [Node.js](https://nodejs.org/en/) manually or ...
  * Install [Node Version Manager](https://github.com/nvm-sh/nvm) and ...
    * Install **Node.js** executing `nvm use v18` or `nvm use stable`

### Create project from scratch
* Create project using `npm init`
* Install [Jest](https://jestjs.io/) using `npm install --save-dev jest`
* Configure scripts in `package.json`:
  ```json
  "scripts": {
    "start": "node index.js",
    "test": "jest"
  }
  ```

### Run this project
* Install dependencies running `npm install`
* Test with `npm test`
* Run with `npm start`
