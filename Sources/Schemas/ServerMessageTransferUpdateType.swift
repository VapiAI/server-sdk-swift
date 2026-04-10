import Foundation

/// This is the type of the message. "transfer-update" is sent whenever a transfer happens.
public enum ServerMessageTransferUpdateType: String, Codable, Hashable, CaseIterable, Sendable {
    case transferUpdate = "transfer-update"
}