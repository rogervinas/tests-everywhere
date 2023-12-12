import XCTest

@testable import Hello

final class HelloMessageTest: XCTestCase {
  func testHelloMessageShouldReturnHelloWorld() throws {
    let message = HelloMessage()
    XCTAssertEqual(message.👋, "Hello World!")
  }
}
