import Foundation

public struct CartesiaPronunciationDictItem: Codable, Hashable, Sendable {
    /// The text to be replaced in pronunciation
    public let text: String
    /// The pronunciation alias or IPA representation
    /// Can be a "sounds-like" guidance (e.g., "VAH-pee") or IPA notation (e.g., "<<ˈ|v|ɑ|ˈ|p|i>>")
    public let alias: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        text: String,
        alias: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.text = text
        self.alias = alias
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decode(String.self, forKey: .text)
        self.alias = try container.decode(String.self, forKey: .alias)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.text, forKey: .text)
        try container.encode(self.alias, forKey: .alias)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case text
        case alias
    }
}