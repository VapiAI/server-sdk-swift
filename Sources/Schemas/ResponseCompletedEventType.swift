import Foundation

/// Event type
public enum ResponseCompletedEventType: String, Codable, Hashable, CaseIterable, Sendable {
    case responseCompleted = "response.completed"
}