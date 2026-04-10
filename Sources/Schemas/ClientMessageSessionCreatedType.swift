import Foundation

/// This is the type of the message. "session.created" is sent when a new session is created.
public enum ClientMessageSessionCreatedType: String, Codable, Hashable, CaseIterable, Sendable {
    case sessionCreated = "session.created"
}