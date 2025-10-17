import Foundation

/// This is spoken to the customer before connecting them to the destination.
/// 
/// Usage:
/// - If this is not provided and transfer tool messages is not provided, default is "Transferring the call now".
/// - If set to "", nothing is spoken. This is useful when you want to silently transfer. This is especially useful when transferring between assistants in a squad. In this scenario, you likely also want to set `assistant.firstMessageMode=assistant-speaks-first-with-model-generated-message` for the destination assistant.
/// 
/// This accepts a string or a ToolMessageStart class. Latter is useful if you want to specify multiple messages for different languages through the `contents` field.
public enum TransferDestinationSipMessage: Codable, Hashable, Sendable {
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