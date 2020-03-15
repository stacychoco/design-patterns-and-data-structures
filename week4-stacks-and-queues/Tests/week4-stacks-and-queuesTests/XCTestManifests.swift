import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(week4_stacks_and_queuesTests.allTests),
    ]
}
#endif
