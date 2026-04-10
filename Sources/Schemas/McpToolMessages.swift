import Foundation

public struct McpToolMessages: Codable, Hashable, Sendable {
    /// The name of the tool from the MCP server.
    public let name: String
    /// Custom messages for this specific tool. Set to an empty array to suppress all messages for this tool. If not provided, the tool will use the default messages from the parent MCP tool configuration.
    public let messages: [McpToolMessagesMessagesItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        messages: [McpToolMessagesMessagesItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.messages = messages
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.messages = try container.decodeIfPresent([McpToolMessagesMessagesItem].self, forKey: .messages)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.messages, forKey: .messages)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case messages
    }
}