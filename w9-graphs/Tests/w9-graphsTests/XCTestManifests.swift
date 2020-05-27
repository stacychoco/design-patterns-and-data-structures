import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(w9_graphsTests.allTests),
    ]
}
#endif
