import Foundation

/// This configures how transfer is executed and the experience of the destination party receiving the call.
/// 
/// Usage:
/// - `blind-transfer`: The assistant forwards the call to the destination without any message or summary.
/// - `blind-transfer-add-summary-to-sip-header`: The assistant forwards the call to the destination and adds a SIP header X-Transfer-Summary to the call to include the summary.
/// - `warm-transfer-say-message`: The assistant dials the destination, delivers the `message` to the destination party, connects the customer, and leaves the call.
/// - `warm-transfer-say-summary`: The assistant dials the destination, provides a summary of the call to the destination party, connects the customer, and leaves the call.
/// - `warm-transfer-wait-for-operator-to-speak-first-and-then-say-message`: The assistant dials the destination, waits for the operator to speak, delivers the `message` to the destination party, and then connects the customer.
/// - `warm-transfer-wait-for-operator-to-speak-first-and-then-say-summary`: The assistant dials the destination, waits for the operator to speak, provides a summary of the call to the destination party, and then connects the customer.
/// - `warm-transfer-twiml`: The assistant dials the destination, executes the twiml instructions on the destination call leg, connects the customer, and leaves the call.
/// - `warm-transfer-experimental`: The assistant puts the customer on hold, dials the destination, and if the destination answers (and is human), delivers a message or summary before connecting the customer. If the destination is unreachable or not human (e.g., with voicemail detection), the assistant delivers the `fallbackMessage` to the customer and optionally ends the call.
/// 
/// @default 'blind-transfer'
public enum TransferPlanMode: String, Codable, Hashable, CaseIterable, Sendable {
    case blindTransfer = "blind-transfer"
    case blindTransferAddSummaryToSipHeader = "blind-transfer-add-summary-to-sip-header"
    case warmTransferSayMessage = "warm-transfer-say-message"
    case warmTransferSaySummary = "warm-transfer-say-summary"
    case warmTransferTwiml = "warm-transfer-twiml"
    case warmTransferWaitForOperatorToSpeakFirstAndThenSayMessage = "warm-transfer-wait-for-operator-to-speak-first-and-then-say-message"
    case warmTransferWaitForOperatorToSpeakFirstAndThenSaySummary = "warm-transfer-wait-for-operator-to-speak-first-and-then-say-summary"
    case warmTransferExperimental = "warm-transfer-experimental"
}