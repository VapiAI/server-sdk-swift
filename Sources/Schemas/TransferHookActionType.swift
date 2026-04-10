import Foundation

/// This is the type of action - must be "transfer"
public enum TransferHookActionType: String, Codable, Hashable, CaseIterable, Sendable {
    case transfer
}