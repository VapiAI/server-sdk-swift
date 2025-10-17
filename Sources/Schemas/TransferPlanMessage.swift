import Foundation

/// This is the message the assistant will deliver to the destination party before connecting the customer.
/// 
/// Usage:
/// - Used only when `mode` is `blind-transfer-add-summary-to-sip-header`, `warm-transfer-say-message`, `warm-transfer-wait-for-operator-to-speak-first-and-then-say-message`, or `warm-transfer-experimental`.
public enum TransferPlanMessage: Codable, Hashable, Sendable {
    case string(String)
    case customMessage(CustomMessage)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode(CustomMessage.self) {
            self = .customMessage(value)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Unexpected value."
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let value):
            try container.encode(value)
        case .customMessage(let value):
            try container.encode(value)
        }
    }
}