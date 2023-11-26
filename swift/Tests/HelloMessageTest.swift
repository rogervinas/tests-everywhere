import XCTest

@testable import Hello

final class HelloMessageTest: XCTestCase {

  func shouldReturnHelloWorld() throws {
    let message = HelloMessage()
    XCTAssertEqual(message.👋, "Hello, World!")
  }
}
