import Foundation

/// The status of the message
public enum ResponseOutputMessageStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case inProgress = "in_progress"
    case completed
    case incomplete
}