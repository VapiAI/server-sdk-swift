import Foundation

public struct CreateChatStreamResponse: Codable, Hashable, Sendable {
    /// This is the unique identifier for the streaming response.
    public let id: String
    /// This is the ID of the session that will be used for the chat.
    /// Helps track conversation context across multiple messages.
    public let sessionId: String?
    /// This is the path to the content being updated.
    /// Format: `chat.output[{contentIndex}].content` where contentIndex identifies the specific content item.
    public let path: String
    /// This is the incremental content chunk being streamed.
    public let delta: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        sessionId: String? = nil,
        path: String,
        delta: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.sessionId = sessionId
        self.path = path
        self.delta = delta
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.sessionId = try container.decodeIfPresent(String.self, forKey: .sessionId)
        self.path = try container.decode(String.self, forKey: .path)
        self.delta = try container.decode(String.self, forKey: .delta)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.sessionId, forKey: .sessionId)
        try container.encode(self.path, forKey: .path)
        try container.encode(self.delta, forKey: .delta)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case sessionId
        case path
        case delta
    }
}