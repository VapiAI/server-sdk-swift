import Foundation

/// This is the type of the message. "session.deleted" is sent when a session is deleted.
public enum ClientMessageSessionDeletedType: String, Codable, Hashable, CaseIterable, Sendable {
    case sessionDeleted = "session.deleted"
}