import Foundation

/// Absent until a result is accepted; a processing failure is never goal_not_met.
public enum CallHealthDashboardGoalCallDtoGoalOutcome: String, Codable, Hashable, CaseIterable, Sendable {
    case goalMet = "goal_met"
    case goalNotMet = "goal_not_met"
    case notApplicable = "not_applicable"
}