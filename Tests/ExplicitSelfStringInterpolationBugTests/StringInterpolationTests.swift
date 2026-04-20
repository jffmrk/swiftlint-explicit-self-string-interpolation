import XCTest

@testable import ExplicitSelfStringInterpolationBug

final class StringInterpolationTests: XCTestCase {
    func testDescription() {
        let subject = StringInterpolation()
        XCTAssertEqual(subject.description, "StringInterpolation{foo: foo}")
    }
}
