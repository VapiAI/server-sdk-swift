import Foundation

public struct OpenAiMessage: Codable, Hashable, Sendable {
    public let content: Nullable<String>?
    public let role: OpenAiMessageRole
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        content: Nullable<String>? = nil,
        role: OpenAiMessageRole,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.content = content
        self.role = role
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.content = try container.decodeNullableIfPresent(String.self, forKey: .content)
        self.role = try container.decode(OpenAiMessageRole.self, forKey: .role)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.content, forKey: .content)
        try container.encode(self.role, forKey: .role)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case content
        case role
    }
}