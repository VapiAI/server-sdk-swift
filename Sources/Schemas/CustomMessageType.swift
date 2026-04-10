import Foundation

/// This is a custom message.
public enum CustomMessageType: String, Codable, Hashable, CaseIterable, Sendable {
    case customMessage = "custom-message"
}