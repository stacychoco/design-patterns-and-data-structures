import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(w5_binary_search_treesTests.allTests),
    ]
}
#endif
