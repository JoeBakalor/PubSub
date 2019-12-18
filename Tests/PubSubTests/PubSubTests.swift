import XCTest
@testable import PubSub

final class PubSubTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(PubSub().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
