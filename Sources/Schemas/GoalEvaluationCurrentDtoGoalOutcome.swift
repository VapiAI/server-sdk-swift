import Foundation

/// Absent until a semantic result is accepted. Processing failures are never goal_not_met.
public enum GoalEvaluationCurrentDtoGoalOutcome: String, Codable, Hashable, CaseIterable, Sendable {
    case goalMet = "goal_met"
    case goalNotMet = "goal_not_met"
    case notApplicable = "not_applicable"
}