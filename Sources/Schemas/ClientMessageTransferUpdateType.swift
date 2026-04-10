import Foundation

/// This is the type of the message. "transfer-update" is sent whenever a transfer happens.
public enum ClientMessageTransferUpdateType: String, Codable, Hashable, CaseIterable, Sendable {
    case transferUpdate = "transfer-update"
}