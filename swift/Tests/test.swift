import XCTest

@testable import Hello

final class HelloTests: XCTestCase {
  func testExample() throws {
    XCTAssertEqual(Hello().text, "Hello, World!")
  }
}
