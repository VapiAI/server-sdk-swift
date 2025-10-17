import Foundation

public struct SpeechmaticsCustomVocabularyItem: Codable, Hashable, Sendable {
    /// The word or phrase to add to the custom vocabulary.
    public let content: String
    /// Alternative phonetic representations of how the word might sound. This helps recognition when the word might be pronounced differently.
    public let soundsLike: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        content: String,
        soundsLike: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.content = content
        self.soundsLike = soundsLike
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.content = try container.decode(String.self, forKey: .content)
        self.soundsLike = try container.decodeIfPresent([String].self, forKey: .soundsLike)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.content, forKey: .content)
        try container.encodeIfPresent(self.soundsLike, forKey: .soundsLike)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case content
        case soundsLike
    }
}