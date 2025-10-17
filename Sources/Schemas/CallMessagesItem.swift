import Foundation

public enum CallMessagesItem: Codable, Hashable, Sendable {
    case userMessage(UserMessage)
    case systemMessage(SystemMessage)
    case botMessage(BotMessage)
    case toolCallMessage(ToolCallMessage)
    case toolCallResultMessage(ToolCallResultMessage)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(UserMessage.self) {
            self = .userMessage(value)
        } else if let value = try? container.decode(SystemMessage.self) {
            self = .systemMessage(value)
        } else if let value = try? container.decode(BotMessage.self) {
            self = .botMessage(value)
        } else if let value = try? container.decode(ToolCallMessage.self) {
            self = .toolCallMessage(value)
        } else if let value = try? container.decode(ToolCallResultMessage.self) {
            self = .toolCallResultMessage(value)
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
        case .userMessage(let value):
            try container.encode(value)
        case .systemMessage(let value):
            try container.encode(value)
        case .botMessage(let value):
            try container.encode(value)
        case .toolCallMessage(let value):
            try container.encode(value)
        case .toolCallResultMessage(let value):
            try container.encode(value)
        }
    }
}