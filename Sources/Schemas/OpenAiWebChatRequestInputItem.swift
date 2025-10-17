import Foundation

public enum OpenAiWebChatRequestInputItem: Codable, Hashable, Sendable {
    case systemMessage(SystemMessage)
    case userMessage(UserMessage)
    case assistantMessage(AssistantMessage)
    case toolMessage(ToolMessage)
    case developerMessage(DeveloperMessage)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(SystemMessage.self) {
            self = .systemMessage(value)
        } else if let value = try? container.decode(UserMessage.self) {
            self = .userMessage(value)
        } else if let value = try? container.decode(AssistantMessage.self) {
            self = .assistantMessage(value)
        } else if let value = try? container.decode(ToolMessage.self) {
            self = .toolMessage(value)
        } else if let value = try? container.decode(DeveloperMessage.self) {
            self = .developerMessage(value)
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
        case .systemMessage(let value):
            try container.encode(value)
        case .userMessage(let value):
            try container.encode(value)
        case .assistantMessage(let value):
            try container.encode(value)
        case .toolMessage(let value):
            try container.encode(value)
        case .developerMessage(let value):
            try container.encode(value)
        }
    }
}