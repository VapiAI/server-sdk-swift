import Foundation

/// Status of the response
public enum ResponseObjectStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case completed
    case failed
    case inProgress = "in_progress"
    case incomplete
}