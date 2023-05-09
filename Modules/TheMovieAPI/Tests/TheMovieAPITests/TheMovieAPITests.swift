import XCTest
@testable import TheMovieAPI

final class TheMovieAPITests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(TheMovieAPI().text, "Hello, World!")
    }
}
