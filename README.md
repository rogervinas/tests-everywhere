# Tests, Tests Everywhere!

Welcome to the **Hello World!** of **testing** using the most popular programming languages ...

| [![](.files/java.png)](java) | [![](.files/kotlin.png)](kotlin) | [![](.files/javascript.png)](javascript) | [![](.files/ruby.png)](ruby) | [![](.files/go.png)](go) | [![](.files/scala.png)](scala) | [![](.files/python.png)](python) | [![](.files/rust.png)](rust) |
|:----------------------------:|:--------------------------------:|:----------------------------------------:|:----------------------------:|:------------------------:|:------------------------------:|:--------------------------------:|:----------------------------:|
|         [Java](java)         |         [Kotlin](kotlin)         |         [JavaScript](javascript)         |         [Ruby](ruby)         |         [Go](go)         |         [Scala](scala)         |         [Python](python)         |         [Rust](rust)         |

In each of them we will implement this simple logic:
```mermaid
%%{ init: { "sequence": { "mirrorActors": false } } }%%
sequenceDiagram
  participant Main
  participant HelloApp as Hello<br>App
  participant HelloMessage as Hello<br>Message
  participant HelloConsole as Hello<br>Console
  Main ->> HelloMessage: Create
  Main ->> HelloConsole: Create
  Main ->> HelloApp: Create
  Main ->>+ HelloApp: printHello()
  HelloApp ->> HelloMessage: getText()
  HelloMessage -->> HelloApp: "Hello World!"
  HelloApp ->> HelloConsole: print("Hello World!")
  HelloApp -->>- Main: #0032;
```

And we will test both **HelloMessage** ...
```mermaid
%%{ init: { "sequence": { "mirrorActors": false } } }%%
sequenceDiagram
  participant Test
  participant HelloMessage as Hello<br>Message
  Test ->> HelloMessage: Create
  Test ->> HelloMessage: getText()
  HelloMessage -->> Test: "Hello World!"
  Test ->> Test: Assert Text<br>is "Hello World!"
```

... and **HelloApp**:
```mermaid
%%{ init: { "sequence": { "mirrorActors": false } } }%%
sequenceDiagram
  participant Test
  participant HelloApp as Hello<br>App
  participant HelloMessageMock as Hello Message<br>Mock
  participant HelloConsoleMock as Hello Console<br>Mock
  Test ->> HelloMessageMock: Create
  Test ->> HelloConsoleMock: Create
  Test ->> HelloApp: Create
  Test ->>+ HelloApp: printHello()
  HelloApp ->> HelloMessageMock: getText()
  HelloMessageMock -->> HelloApp: "Hello Test!"
  HelloApp ->> HelloConsoleMock: print("Hello Test!")
  HelloApp -->>- Test: #0032;
  Test ->> Test: Verify Hello Console Mock<br>has been called once<br>with "Hello Test!"
```

Happy Coding! 💙
