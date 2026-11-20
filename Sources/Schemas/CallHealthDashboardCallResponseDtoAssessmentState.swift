import Foundation

/// Classification state, named as in the coverage `classification` counters.
public enum CallHealthDashboardCallResponseDtoAssessmentState: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case unavailable
    case skipped
    case error
    case excluded
    case complete
    case partial
}