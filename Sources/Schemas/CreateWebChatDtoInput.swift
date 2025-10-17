import Foundation

/// This is the input text for the chat.
/// Can be a string or an array of chat messages.
public enum CreateWebChatDtoInput: Codable, Hashable, Sendable {
    case string(String)
    case createWebChatDtoInputItemArray([CreateWebChatDtoInputItem])

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode([CreateWebChatDtoInputItem].self) {
            self = .createWebChatDtoInputItemArray(value)
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
        case .createWebChatDtoInputItemArray(let value):
            try container.encode(value)
        }
    }
}