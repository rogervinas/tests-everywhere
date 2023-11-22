[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/dotnet.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/dotnet.yml)
![.NET](https://img.shields.io/badge/.NET-8.0-blue?labelColor=black)

# .NET

[.NET C#](https://learn.microsoft.com/dotnet/csharp) testing with [NUnit](https://nunit.org/) and [Moq](https://www.devlooped.com/moq/)

- [Show me the code](#show-me-the-code)
  - [Implementation](#implementation)
  - [Test](#test)
- [Run this project using 🐳 docker](#run-this-project-using--docker)
- [Run this project locally](#run-this-project-locally)

## Show me the code

### Implementation

1. Create `HelloMessage` interface and `HelloWorldMessage` implementing it in [Hello.Main/HelloMessage.cs](Hello.Main/HelloMessage.cs):

```csharp
public interface HelloMessage
{
    public String Text {
        get;
    }
}

public class HelloWorldMessage : HelloMessage
{
    public string Text {
        get {
            return "Hello World!";
        }
    }
}
```

Creating it as an interface will allow us to mock it for testing using [Moq](https://www.devlooped.com/moq/) which does not support mocking final classes. Maybe other libraries support that but using an interface is simpler.

2. Same way create `HelloConsole` interface and `HelloSystemConsole` class implementing it in [Hello.Main/HelloConsole.cs](Hello.Main/HelloConsole.cs):

```csharp
public interface HelloConsole {
    void Print(String text);
}

public class HelloSystemConsole : HelloConsole
{
    public void Print(String text) {
        Console.WriteLine(text);
    }
}
```

4. Create `HelloApp` in [Hello.Main/HelloApp.cs](Hello.Main/HelloApp.cs):

```csharp
public class HelloApp
{
    private HelloMessage message;
    private HelloConsole console;

    public HelloApp(HelloMessage message, HelloConsole console) {
        this.message = message;
        this.console = console;
    }

    public void PrintHello() {
        console.Print(message.Text);
    }
}
```

5. Create main [Hello.Main/Program.cs](Hello.Main/Program.cs) that wraps it all together:

```csharp
var message = new HelloWorldMessage();
var console = new HelloSystemConsole();
var app = new HelloApp(message, console);
app.PrintHello();
```

### Test

Following [NUnit > Writing Tests](https://docs.nunit.org/articles/nunit/writing-tests/attributes.html) guide ...

1. Test `HelloMessage` in [Hello.Test/HelloMessageTest.cs](Hello.Test/HelloMessageTest.cs):

```csharp
[Test]
public void ShouldReturnHelloWorld()
{
    var message = new HelloWorldMessage();
    Assert.That(message.Text, Is.EqualTo("Hello World!"));
}
```

2. Test `HelloApp` in [Hello.Test/HelloAppTest.cs](Hello.Test/HelloAppTest.cs):

```csharp
[Test]
public void ShouldPrintHelloMessage()
{
    var messageText = "Hello Test!";

    // 2.1 Create a mock of HelloMessage
    var messageMock = new Mock<HelloMessage>();
    // - Expect HelloMessage mock to receive a call to .Text
    // and return "Hello Test!"
    messageMock.Setup(message => message.Text).Returns(messageText);
    // Get the mock object to pass it to HelloApp
    var message = messageMock.Object;

    // 2.2 Create a mock of HelloConsol
    var consoleMock = new Mock<HelloConsole>();
    // - No need to set expectations for this one
    // - Get the mock object to pass it to HelloApp
    var console = consoleMock.Object;

    // 2.3 Create a HelloApp, the one we want to test, passing the mocks
    var app = new HelloApp(message, console);
    // - Execute the method we want to test
    app.PrintHello();

    // 2.4 Verify HelloConsole mock has received one time
    // a call to .Print with "Hello Test!"
    consoleMock.Verify(console => console.Print(messageText), Times.Once);
}
```

3. Test output should look like:

```
NUnit Adapter 4.2.0.0: Test execution complete
  Passed ShouldPrintHelloMessage [180 ms]
  Passed ShouldReturnHelloWorld [7 ms]

Test Run Successful.
Total tests: 2
     Passed: 2
 Total time: 2.7702 Seconds
```

## Run this project using 🐳 [docker](https://www.docker.com/)

- Execute `./docker-run.sh`
- Once inside the container:
  - Test with `dotnet test -v quiet -l:"console;verbosity=normal"`
  - Run with `dotnet run --project Hello.Main`
  - Build with `dotnet publish -c Release`

## Run this project locally

### Pre-requisites

- Install [.NET](https://dotnet.microsoft.com/download)
  - Check [.NET CLI](https://learn.microsoft.com/dotnet/core/tools/) executing `dotnet --version`

### Create project from scratch

- Execute these commands:

```
dotnet new sln --name Hello

dotnet new console --language "C#" --framework net8.0 --name Hello.Main

dotnet new nunit --language "C#" --framework net8.0 --name Hello.Test
dotnet add ./Hello.Test reference ./Hello.Main
dotnet add ./Hello.Test package Moq --version 4.20.69

dotnet sln Hello.sln add ./Hello.Main ./Hello.Test
```

### Run locally

- Test with `dotnet test -v quiet -l:"console;verbosity=normal"`
- Run with `dotnet run --project Hello.Main`
- Build with `dotnet publish -c Release`
