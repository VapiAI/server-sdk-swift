import Foundation

public enum TransferMode: String, Codable, Hashable, CaseIterable, Sendable {
    case rollingHistory = "rolling-history"
    case swapSystemMessageInHistory = "swap-system-message-in-history"
}