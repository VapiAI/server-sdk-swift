import Foundation

/// The transfer mode (e.g. warm-transfer-experimental, blind-transfer).
public enum TransferArtifactMode: String, Codable, Hashable, CaseIterable, Sendable {
    case blindTransfer = "blind-transfer"
    case blindTransferAddSummaryToSipHeader = "blind-transfer-add-summary-to-sip-header"
    case warmTransferSayMessage = "warm-transfer-say-message"
    case warmTransferSaySummary = "warm-transfer-say-summary"
    case warmTransferTwiml = "warm-transfer-twiml"
    case warmTransferWaitForOperatorToSpeakFirstAndThenSayMessage = "warm-transfer-wait-for-operator-to-speak-first-and-then-say-message"
    case warmTransferWaitForOperatorToSpeakFirstAndThenSaySummary = "warm-transfer-wait-for-operator-to-speak-first-and-then-say-summary"
    case warmTransferExperimental = "warm-transfer-experimental"
}