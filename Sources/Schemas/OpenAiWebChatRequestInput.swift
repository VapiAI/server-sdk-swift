import Foundation

/// This is the input text for the chat.
/// Can be a string or an array of chat messages.
public enum OpenAiWebChatRequestInput: Codable, Hashable, Sendable {
    case string(String)
    case openAiWebChatRequestInputItemArray([OpenAiWebChatRequestInputItem])

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode([OpenAiWebChatRequestInputItem].self) {
            self = .openAiWebChatRequestInputItemArray(value)
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
        case .openAiWebChatRequestInputItemArray(let value):
            try container.encode(value)
        }
    }
}