import Foundation

/// The type of tool. "transferCancel" for Transfer Cancel tool. This tool can only be used during warm-transfer-experimental by the transfer assistant to cancel an ongoing transfer and return the call back to the original assistant when the transfer cannot be completed.
public enum TransferCancelToolUserEditableType: String, Codable, Hashable, CaseIterable, Sendable {
    case transferCancel
}