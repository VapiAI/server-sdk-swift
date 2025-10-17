import Foundation

public struct CustomMessage: Codable, Hashable, Sendable {
    /// This is an alternative to the `content` property. It allows to specify variants of the same content, one per language.
    /// 
    /// Usage:
    /// - If your assistants are multilingual, you can provide content for each language.
    /// - If you don't provide content for a language, the first item in the array will be automatically translated to the active language at that moment.
    /// 
    /// This will override the `content` property.
    public let contents: [TextContent]?
    /// This is a custom message.
    public let type: CustomMessage
    /// This is the content that the assistant will say when this message is triggered.
    public let content: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        contents: [TextContent]? = nil,
        type: CustomMessage,
        content: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.contents = contents
        self.type = type
        self.content = content
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.contents = try container.decodeIfPresent([TextContent].self, forKey: .contents)
        self.type = try container.decode(CustomMessage.self, forKey: .type)
        self.content = try container.decodeIfPresent(String.self, forKey: .content)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.contents, forKey: .contents)
        try container.encode(self.type, forKey: .type)
        try container.encodeIfPresent(self.content, forKey: .content)
    }

    public enum CustomMessage: String, Codable, Hashable, CaseIterable, Sendable {
        case customMessage = "custom-message"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case contents
        case type
        case content
    }
}