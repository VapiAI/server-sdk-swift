import Foundation

/// This is the prompt for the assistant to generate a response based on existing conversation.
/// Can be a string or an array of chat messages.
public enum SayHookActionPrompt: Codable, Hashable, Sendable {
    case sayHookActionPromptOneItemArray([SayHookActionPromptOneItem])
    case string(String)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode([SayHookActionPromptOneItem].self) {
            self = .sayHookActionPromptOneItemArray(value)
        } else if let value = try? container.decode(String.self) {
            self = .string(value)
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
        case .sayHookActionPromptOneItemArray(let value):
            try container.encode(value)
        case .string(let value):
            try container.encode(value)
        }
    }
}