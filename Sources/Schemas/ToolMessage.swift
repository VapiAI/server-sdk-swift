import Foundation

public struct ToolMessage: Codable, Hashable, Sendable {
    /// This is the role of the message author
    public let role: Tool
    /// This is the content of the tool message
    public let content: String
    /// This is the ID of the tool call this message is responding to
    public let toolCallId: String
    /// This is an optional name for the participant
    public let name: String?
    /// This is an optional metadata for the message
    public let metadata: [String: JSONValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        role: Tool,
        content: String,
        toolCallId: String,
        name: String? = nil,
        metadata: [String: JSONValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.role = role
        self.content = content
        self.toolCallId = toolCallId
        self.name = name
        self.metadata = metadata
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.role = try container.decode(Tool.self, forKey: .role)
        self.content = try container.decode(String.self, forKey: .content)
        self.toolCallId = try container.decode(String.self, forKey: .toolCallId)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.metadata = try container.decodeIfPresent([String: JSONValue].self, forKey: .metadata)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.role, forKey: .role)
        try container.encode(self.content, forKey: .content)
        try container.encode(self.toolCallId, forKey: .toolCallId)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
    }

    public enum Tool: String, Codable, Hashable, CaseIterable, Sendable {
        case tool
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case role
        case content
        case toolCallId = "tool_call_id"
        case name
        case metadata
    }
}