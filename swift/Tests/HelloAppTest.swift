import XCTest

@testable import Hello

final class HelloAppTest: XCTestCase {

  func testHelloAppShouldDisplayHelloMessage() throws {
    let message = MockHelloMessage()
    XCTAssertEqual(message.👋, "Hello, World!")
  }
}
