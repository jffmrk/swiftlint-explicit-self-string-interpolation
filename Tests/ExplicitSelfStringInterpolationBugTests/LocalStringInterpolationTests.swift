import XCTest

@testable import ExplicitSelfStringInterpolationBug

final class LocalStringInterpolationTests: XCTestCase {
    func testDescription() {
        let subject = LocalStringInterpolation()
        XCTAssertEqual(subject.bar, "AB")
    }
}
