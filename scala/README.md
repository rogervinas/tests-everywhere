[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/scala.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/scala.yml)
![Java](https://img.shields.io/badge/Java-21-blue?labelColor=black)
![Scala](https://img.shields.io/badge/Scala-3.3.1-blue?labelColor=black)

# Scala

[Scala](https://www.scala-lang.org/) testing with [ScalaTest](https://www.scalatest.org/) and [Mockito](https://www.scalatest.org/plus/mockito)

## Run this project using 🐳 [docker](https://www.docker.com/)
* Go to [java](java) folder
* Execute `./docker-run.sh`
* Once inside the container:
    * Test with `sbt test`
    * Run with `sbt run`

## Run this project locally

### Pre-requisites
* Install [Java](https://openjdk.org/) manually or ...
  * Install [SdkMan](https://sdkman.io/) and ...
    * List available versions executing `sdk list java`
* Install [Scala](https://www.scala-lang.org/download/) 
  * Install [Coursier](https://get-coursier.io/) and execute `cs install scala:3.3.1`

### Run locally
* Go to [scala](scala) folder
* Test with `sbt test`
* Run with `sbt run`

### Create project from scratch
* Create project using `sbt new scala/scala3.g8` (⚠️ maybe you get an error with **Java 21** and you'll need **Java 17** just for this step)
* Add [ScalaTest](https://www.scalatest.org/) and [Mockito](https://www.scalatest.org/plus/mockito) dependencies in [build.sbt](build.sbt):
```sbt
    libraryDependencies += "org.scalatest" %% "scalatest" % "3.2.17" % Test,
    libraryDependencies += "org.scalatestplus" %% "mockito-4-11" % "3.2.17.0" % Test
```

💡 Alternatively you can create a project using [Gradle Scala Application Sample](https://docs.gradle.org/current/samples/sample_building_scala_applications.html)
