# Tests, Tests Everywhere!

![Meme](.files/meme.jpg)

1) [Java](#java)
2) [Kotlin](#kotlin)
3) [JavaScript](#javascript)
4) [Ruby](#ruby)

## Java

[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/java.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/java.yml)
![Java](https://img.shields.io/badge/Java-21-blue?labelColor=black)

**Java** testing with [JUnit5](https://junit.org/junit5/), [Mockito](https://site.mockito.org/) and [AssertJ](https://assertj.github.io/doc/)

### Run this project using 🐳 [docker](https://www.docker.com/)
* Go to [java](java) folder
* Execute `./docker-run.sh`
* Once inside the container:
  * Test with `./gradlew test`
  * Run with `./gradlew run`

### Run this project locally

#### Pre-requisites
* Install [Java](https://openjdk.org/) and [Gradle](https://gradle.org/) manually or ...
  * Install [SdkMan](https://sdkman.io/) and ...
    * Install **Java** using `sdk install java 21-tem` (use `sdk list java` to see all versions)
    * Install **Gradle** using `sdk install grade 8.4` (use `sdk list gradle` to see all versions)

#### Run locally
* Go to [java](java) folder
* Test with `./gradlew test`
* Run with `./gradlew run`

#### Create project from scratch
* Create project using `gradle init --type java-application --dsl kotlin --test-framework junit-jupiter`
* Add [Mockito](https://site.mockito.org/) and [AssertJ](https://assertj.github.io/doc/) dependencies in [build.gradle.kts](java/build.gradle.kts):
  * `testImplementation("org.mockito:mockito-core:x.x.x")`
  * `testImplementation("org.assertj:assertj-core:x.x.x")`

## Kotlin

[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/kotlin.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/kotlin.yml)
![Java](https://img.shields.io/badge/Java-21-blue?labelColor=black)
![Kotlin](https://img.shields.io/badge/Kotlin-1.9.20-blue?labelColor=black)

**Kotlin** testing with [Kotest](https://kotest.io) and [MockK](https://mockk.io/)

### Run this project using 🐳 [docker](https://www.docker.com/)
* Go to [kotlin](kotlin) folder
* Execute `./docker-run.sh`
* Once inside the container:
  * Test with `./gradlew test`
  * Run with `./gradlew run`

### Run this project locally

#### Pre-requisites
* Install [Java](https://openjdk.org/) and [Gradle](https://gradle.org/) manually or ...
  * Install [SdkMan](https://sdkman.io/) and ...
    * Install **Java** using `sdk install java 21-tem` (use `sdk list java` to see all versions)
    * Install **Gradle** using `sdk install grade 8.4` (use `sdk list gradle` to see all versions)

#### Run locally
* Go to [kotlin](kotlin) folder
* Test with `./gradlew test`
* Run with `./gradlew run`

#### Create project from scratch
* Create project using `gradle init --type kotlin-application --dsl kotlin --test-framework kotlintest`
* Add [Kotest](https://kotest.io) and [MockK](https://mockk.io/) dependencies in [build.gradle.kts](kotlin/build.gradle.kts):
  * `testImplementation("io.kotest:kotest-runner-junit5:x.x.x")`
  * `testImplementation("io.mockk:mockk:x.x.x")`

## JavaScript

[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/javascript.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/javascript.yml)
![Node](https://img.shields.io/badge/Node-18.x-blue?labelColor=black)

**JavaScript** testing with [Jest](https://jestjs.io/)

### Run this project using 🐳 [docker](https://www.docker.com/)
* Go to [kotlin](kotlin) folder
* Execute `./docker-run.sh`
* Once inside the container:
  * First time only, install dependencies with `npm install` 
  * Test with `npm test`
  * Run with `npm start`

### Run this project locally

#### Pre-requisites
* Install [Node.js](https://nodejs.org/en/) manually or ...
  * Install [Node Version Manager](https://github.com/nvm-sh/nvm) and ...
    * Install **Node.js** executing `nvm use v18` or `nvm use stable`

#### Run locally
* Go to [javascript](javascript) folder
* First time only, install dependencies with `npm install`
* Test with `npm test`
* Run with `npm start`

#### Create project from scratch
* Create project using `npm init`
* Install [Jest](https://jestjs.io/) using `npm install --save-dev jest`
* Configure scripts in [package.json](javascript/package.json):
  ```json
  "scripts": {
    "start": "node Main.js",
    "test": "jest"
  }
  ```

## Ruby

[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/ruby.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/ruby.yml)
![Ruby](https://img.shields.io/badge/Ruby-3.x-blue?labelColor=black)

**Ruby** testing with [RSpec](https://rspec.info/)

### Run this project using 🐳 [docker](https://www.docker.com/)
* Go to [ruby](ruby) folder
* Execute `./docker-run.sh`
* Once inside the container:
  * First time only, install dependencies with `bundle install`
  * Test with `rspec -fd`
  * Run with `ruby lib/Main.rb`
