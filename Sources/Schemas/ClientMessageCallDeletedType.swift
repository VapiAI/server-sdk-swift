import Foundation

/// This is the type of the message. "call.deleted" is sent when a call is deleted.
public enum ClientMessageCallDeletedType: String, Codable, Hashable, CaseIterable, Sendable {
    case callDeleted = "call.deleted"
}