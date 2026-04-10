import Foundation

/// This is the input text for the chat.
/// Can be a string or an array of chat messages.
public enum ChatInput: Codable, Hashable, Sendable {
    case chatInputOneItemArray([ChatInputOneItem])
    case string(String)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode([ChatInputOneItem].self) {
            self = .chatInputOneItemArray(value)
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
        case .chatInputOneItemArray(let value):
            try container.encode(value)
        case .string(let value):
            try container.encode(value)
        }
    }
}