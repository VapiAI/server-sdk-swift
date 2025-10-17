import Foundation

public struct GladiaCustomVocabularyConfigDto: Codable, Hashable, Sendable {
    /// Array of vocabulary items (strings or objects with value, pronunciations, intensity, language)
    public let vocabulary: [GladiaCustomVocabularyConfigDtoVocabularyItem]
    /// Default intensity for vocabulary items (0.0 to 1.0)
    public let defaultIntensity: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        vocabulary: [GladiaCustomVocabularyConfigDtoVocabularyItem],
        defaultIntensity: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.vocabulary = vocabulary
        self.defaultIntensity = defaultIntensity
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.vocabulary = try container.decode([GladiaCustomVocabularyConfigDtoVocabularyItem].self, forKey: .vocabulary)
        self.defaultIntensity = try container.decodeIfPresent(Double.self, forKey: .defaultIntensity)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.vocabulary, forKey: .vocabulary)
        try container.encodeIfPresent(self.defaultIntensity, forKey: .defaultIntensity)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case vocabulary
        case defaultIntensity
    }
}