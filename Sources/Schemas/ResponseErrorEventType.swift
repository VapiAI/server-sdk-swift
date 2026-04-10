import Foundation

/// Event type
public enum ResponseErrorEventType: String, Codable, Hashable, CaseIterable, Sendable {
    case error
}