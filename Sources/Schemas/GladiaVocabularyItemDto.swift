import Foundation

public struct GladiaVocabularyItemDto: Codable, Hashable, Sendable {
    /// The vocabulary word or phrase
    public let value: String
    /// Alternative pronunciations for the vocabulary item
    public let pronunciations: [String]?
    /// Intensity for this specific vocabulary item (0.0 to 1.0)
    public let intensity: Double?
    /// Language code for this vocabulary item (ISO 639-1)
    public let language: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        value: String,
        pronunciations: [String]? = nil,
        intensity: Double? = nil,
        language: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.value = value
        self.pronunciations = pronunciations
        self.intensity = intensity
        self.language = language
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decode(String.self, forKey: .value)
        self.pronunciations = try container.decodeIfPresent([String].self, forKey: .pronunciations)
        self.intensity = try container.decodeIfPresent(Double.self, forKey: .intensity)
        self.language = try container.decodeIfPresent(String.self, forKey: .language)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.value, forKey: .value)
        try container.encodeIfPresent(self.pronunciations, forKey: .pronunciations)
        try container.encodeIfPresent(self.intensity, forKey: .intensity)
        try container.encodeIfPresent(self.language, forKey: .language)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case value
        case pronunciations
        case intensity
        case language
    }
}