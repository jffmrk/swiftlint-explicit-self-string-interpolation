import XCTest

@testable import ExplicitSelfStringInterpolationBug

final class RawStringInterpolationTests: XCTestCase {
    func testDescription() {
        let subject = RawStringInterpolation()
        XCTAssertEqual(
            subject.description,
            #"StringInterpolation{foo: foo} using "raw" string literals."#
        )
    }
}
