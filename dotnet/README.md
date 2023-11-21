[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/dotnet.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/dotnet.yml)
![.NET](https://img.shields.io/badge/.NET-8.0-blue?labelColor=black)

# .NET

[.NET C#](https://learn.microsoft.com/dotnet/csharp) testing with [NUnit](https://nunit.org/) and [Moq](https://www.devlooped.com/moq/)

## Run this project using 🐳 [docker](https://www.docker.com/)
* Execute `./docker-run.sh`
* Once inside the container:
  * Test with `dotnet test -v quiet -l:"console;verbosity=normal"`
  * Run with `dotnet run --project Hello.Main`
  * Build with `dotnet publish -c Release`

## Run this project locally

### Pre-requisites
* Install [.NET](https://dotnet.microsoft.com/download)
  * Check [.NET CLI](https://learn.microsoft.com/dotnet/core/tools/) executing `dotnet --version`

### Run locally
* Test with `dotnet test -v quiet -l:"console;verbosity=normal"`
* Run with `dotnet run --project Hello.Main`
* Build with `dotnet publish -c Release`

### Create project from scratch
* Execute these commands:
  ```
  dotnet new sln --name Hello
  
  dotnet new console --language "C#" --framework net8.0 --name Hello.Main
  
  dotnet new nunit --language "C#" --framework net8.0 --name Hello.Test
  dotnet add ./Hello.Test reference ./Hello.Main
  dotnet add ./Hello.Test package Moq --version 4.20.69

  dotnet sln Hello.sln add ./Hello.Main ./Hello.Test
  ```
