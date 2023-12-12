import Cuckoo
import XCTest

@testable import Hello

final class HelloAppTest: XCTestCase {

  func testHelloAppShouldDisplayHelloMessage() throws {
    let message = MockHelloMessage()
    stub(message) { stub in
      when(stub.👋.get).thenReturn("Hello Test!")
    }

    let console = MockHelloConsole()
    stub(console) { stub in
      when(stub.print(👋: anyString())).thenDoNothing()
    }

    let app = HelloApp(message: message, console: console)
    app.printHello()

    verify(console).print(👋: "Hello Test!")
  }
}
