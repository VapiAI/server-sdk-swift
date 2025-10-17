import Foundation

public struct TextContent: Codable, Hashable, Sendable {
    public let type: Text
    public let text: String
    public let language: TextContentLanguage
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: Text,
        text: String,
        language: TextContentLanguage,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.text = text
        self.language = language
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(Text.self, forKey: .type)
        self.text = try container.decode(String.self, forKey: .text)
        self.language = try container.decode(TextContentLanguage.self, forKey: .language)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.text, forKey: .text)
        try container.encode(self.language, forKey: .language)
    }

    public enum Text: String, Codable, Hashable, CaseIterable, Sendable {
        case text
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case text
        case language
    }
}