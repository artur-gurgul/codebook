import XCTest
@testable import playground

final class playgroundTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(playground().text, "Hello, World!")
    }
}
