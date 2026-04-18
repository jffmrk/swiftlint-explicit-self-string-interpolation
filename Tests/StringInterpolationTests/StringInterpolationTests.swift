import XCTest

@testable import ExplicitSelfStringInterpolationBug

final class StringInterpolationTests: XCTestCase {
    func testDescription() {
        let subject = StringInterpolation()
        XCTAssertEqual(subject.description, "StringInterpolation{foo: foo}")
    }

    func testRawStringLiteral() {
        let subject = StringInterpolation()
        XCTAssertEqual(
            subject.rawStringLiteral,
            #"StringInterpolation{foo: foo} using "raw" string literals."#
        )
    }
}
