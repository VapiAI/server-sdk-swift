import Foundation

/// A conversation message represented in OpenAI chat format.
public struct OpenAiMessage: Codable, Hashable, Sendable {
    /// Content of the conversation message.
    public let content: Nullable<String>
    /// Role associated with the conversation message.
    public let role: OpenAiMessageRole
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        content: Nullable<String>,
        role: OpenAiMessageRole,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.content = content
        self.role = role
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.content = try container.decode(Nullable<String>.self, forKey: .content)
        self.role = try container.decode(OpenAiMessageRole.self, forKey: .role)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.content, forKey: .content)
        try container.encode(self.role, forKey: .role)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case content
        case role
    }
}