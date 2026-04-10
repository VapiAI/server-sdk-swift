import Foundation

public struct VapiPronunciationDictionaryLocator: Codable, Hashable, Sendable {
    /// The pronunciation dictionary ID
    public let pronunciationDictId: String
    /// Version ID (only required for ElevenLabs, ignored for Cartesia)
    public let versionId: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        pronunciationDictId: String,
        versionId: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.pronunciationDictId = pronunciationDictId
        self.versionId = versionId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pronunciationDictId = try container.decode(String.self, forKey: .pronunciationDictId)
        self.versionId = try container.decodeIfPresent(String.self, forKey: .versionId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.pronunciationDictId, forKey: .pronunciationDictId)
        try container.encodeIfPresent(self.versionId, forKey: .versionId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case pronunciationDictId
        case versionId
    }
}