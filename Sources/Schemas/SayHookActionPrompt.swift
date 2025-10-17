import Foundation

/// This is the prompt for the assistant to generate a response based on existing conversation.
/// Can be a string or an array of chat messages.
public enum SayHookActionPrompt: Codable, Hashable, Sendable {
    case string(String)
    case sayHookActionPromptItemArray([SayHookActionPromptItem])

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode([SayHookActionPromptItem].self) {
            self = .sayHookActionPromptItemArray(value)
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
        case .sayHookActionPromptItemArray(let value):
            try container.encode(value)
        }
    }
}