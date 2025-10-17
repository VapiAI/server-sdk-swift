import Foundation

/// This is the result of the test suite.
public enum TestSuiteRunScorerAiResult: String, Codable, Hashable, CaseIterable, Sendable {
    case pass
    case fail
}