import Foundation

/// This is the type of the message. "status-update" is sent whenever the `call.status` changes.
public enum ServerMessageStatusUpdateType: String, Codable, Hashable, CaseIterable, Sendable {
    case statusUpdate = "status-update"
}