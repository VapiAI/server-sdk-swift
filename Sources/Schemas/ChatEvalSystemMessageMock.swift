import Foundation

public struct ChatEvalSystemMessageMock: Codable, Hashable, Sendable {
    /// This is the role of the message author.
    /// For a mock system message, the role is always 'system'
    /// @default 'system'
    public let role: ChatEvalSystemMessageMockRole
    /// This is the content of the system message that would have been added in the middle of the conversation.
    /// Do not include the assistant prompt as a part of this message. It will automatically be fetched during runtime.
    public let content: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        role: ChatEvalSystemMessageMockRole,
        content: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.role = role
        self.content = content
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.role = try container.decode(ChatEvalSystemMessageMockRole.self, forKey: .role)
        self.content = try container.decode(String.self, forKey: .content)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.role, forKey: .role)
        try container.encode(self.content, forKey: .content)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case role
        case content
    }
}