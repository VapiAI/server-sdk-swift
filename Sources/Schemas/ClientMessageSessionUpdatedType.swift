import Foundation

/// This is the type of the message. "session.updated" is sent when a session is updated.
public enum ClientMessageSessionUpdatedType: String, Codable, Hashable, CaseIterable, Sendable {
    case sessionUpdated = "session.updated"
}