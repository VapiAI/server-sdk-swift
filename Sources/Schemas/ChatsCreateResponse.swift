import Foundation

public enum ChatsCreateResponse: Codable, Hashable, Sendable {
    case chat(Chat)
    case createChatStreamResponse(CreateChatStreamResponse)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Chat.self) {
            self = .chat(value)
        } else if let value = try? container.decode(CreateChatStreamResponse.self) {
            self = .createChatStreamResponse(value)
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
        case .chat(let value):
            try container.encode(value)
        case .createChatStreamResponse(let value):
            try container.encode(value)
        }
    }
}