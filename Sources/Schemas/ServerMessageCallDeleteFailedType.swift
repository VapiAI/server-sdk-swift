import Foundation

/// This is the type of the message. "call.deleted" is sent when a call is deleted.
public enum ServerMessageCallDeleteFailedType: String, Codable, Hashable, CaseIterable, Sendable {
    case callDeleteFailed = "call.delete.failed"
}