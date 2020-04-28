import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(w7_heaps_priority_queues_huffmanTests.allTests),
    ]
}
#endif
