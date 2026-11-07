import Foundation

public enum GoalEvaluationCurrentDtoProcessingState: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case running
    case parked
    case unavailable
    case excluded
    case completed
}