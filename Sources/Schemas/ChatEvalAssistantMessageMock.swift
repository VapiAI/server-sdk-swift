import Foundation

public struct ChatEvalAssistantMessageMock: Codable, Hashable, Sendable {
    /// This is the content of the assistant message.
    /// This is the message that the assistant would have sent.
    public let content: String?
    /// This is the tool calls that will be made by the assistant.
    public let toolCalls: [ChatEvalAssistantMessageMockToolCall]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        content: String? = nil,
        toolCalls: [ChatEvalAssistantMessageMockToolCall]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.content = content
        self.toolCalls = toolCalls
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.content = try container.decodeIfPresent(String.self, forKey: .content)
        self.toolCalls = try container.decodeIfPresent([ChatEvalAssistantMessageMockToolCall].self, forKey: .toolCalls)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.content, forKey: .content)
        try container.encodeIfPresent(self.toolCalls, forKey: .toolCalls)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case content
        case toolCalls
    }
}