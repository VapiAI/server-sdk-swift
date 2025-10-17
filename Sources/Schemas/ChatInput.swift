import Foundation

/// This is the input text for the chat.
/// Can be a string or an array of chat messages.
public enum ChatInput: Codable, Hashable, Sendable {
    case string(String)
    case chatInputItemArray([ChatInputItem])

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode([ChatInputItem].self) {
            self = .chatInputItemArray(value)
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
        case .chatInputItemArray(let value):
            try container.encode(value)
        }
    }
}