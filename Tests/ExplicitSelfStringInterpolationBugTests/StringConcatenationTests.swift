import XCTest

@testable import ExplicitSelfStringInterpolationBug

final class StringConcatenationTests: XCTestCase {
    func testDescription() {
        let subject = StringConcatenation()
        XCTAssertEqual(subject.description, "1 count")
    }
}
