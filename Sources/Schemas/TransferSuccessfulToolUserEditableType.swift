import Foundation

/// The type of tool. "transferSuccessful" for Transfer Successful tool. This tool can only be used during warm-transfer-experimental by the transfer assistant to confirm that the transfer should proceed and finalize the handoff to the destination.
public enum TransferSuccessfulToolUserEditableType: String, Codable, Hashable, CaseIterable, Sendable {
    case transferSuccessful
}