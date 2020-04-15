import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(w6_red_black_treesTests.allTests),
    ]
}
#endif
