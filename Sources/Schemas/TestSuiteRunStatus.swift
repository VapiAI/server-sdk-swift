import Foundation

/// This is the current status of the test suite run.
public enum TestSuiteRunStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case queued
    case inProgress = "in-progress"
    case completed
    case failed
}