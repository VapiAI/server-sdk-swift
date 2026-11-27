import Foundation

/// Where this call's evaluation under goalVersion stands.
public enum CallHealthDashboardGoalCallDtoProcessingState: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case running
    case parked
    case unavailable
    case excluded
    case completed
}