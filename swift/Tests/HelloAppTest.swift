import Cuckoo
import XCTest

@testable import Hello

final class HelloAppTest: XCTestCase {

  func testHelloAppShouldDisplayHelloMessage() throws {
    let message = MockHelloMessage()
    message.
    stub(message) { stub in
      when(stub.👋.get).thenReturn("Hello Test!")
    }

    let console = MockHelloConsole()
    stub(console) { stub in
      when(stub.print(👋: "Hello Test!")).thenDoNothing()
    }

    XCTAssertEqual(message.👋, "Hello, World!")
  }
}
