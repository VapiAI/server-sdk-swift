import Foundation

public struct ClientInboundMessageAddMessage: Codable, Hashable, Sendable {
    /// This is the message to add to the conversation.
    public let message: OpenAiMessage
    /// This is the flag to trigger a response, or to insert the message into the conversation history silently. Defaults to `true`.
    /// 
    /// Usage:
    /// - Use `true` to trigger a response.
    /// - Use `false` to insert the message into the conversation history silently.
    /// 
    /// @default true
    public let triggerResponseEnabled: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        message: OpenAiMessage,
        triggerResponseEnabled: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.message = message
        self.triggerResponseEnabled = triggerResponseEnabled
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decode(OpenAiMessage.self, forKey: .message)
        self.triggerResponseEnabled = try container.decodeIfPresent(Bool.self, forKey: .triggerResponseEnabled)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.message, forKey: .message)
        try container.encodeIfPresent(self.triggerResponseEnabled, forKey: .triggerResponseEnabled)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case message
        case triggerResponseEnabled
    }
}