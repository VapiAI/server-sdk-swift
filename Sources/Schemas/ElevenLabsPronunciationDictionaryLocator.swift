import Foundation

public struct ElevenLabsPronunciationDictionaryLocator: Codable, Hashable, Sendable {
    /// This is the ID of the pronunciation dictionary to use.
    public let pronunciationDictionaryId: String
    /// This is the version ID of the pronunciation dictionary to use.
    public let versionId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        pronunciationDictionaryId: String,
        versionId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.pronunciationDictionaryId = pronunciationDictionaryId
        self.versionId = versionId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pronunciationDictionaryId = try container.decode(String.self, forKey: .pronunciationDictionaryId)
        self.versionId = try container.decode(String.self, forKey: .versionId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.pronunciationDictionaryId, forKey: .pronunciationDictionaryId)
        try container.encode(self.versionId, forKey: .versionId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case pronunciationDictionaryId
        case versionId
    }
}