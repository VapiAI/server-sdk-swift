import Foundation

public struct FallbackCartesiaTranscriber: Codable, Hashable, Sendable {
    public let model: InkWhisper?
    public let language: FallbackCartesiaTranscriberLanguage?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        model: InkWhisper? = nil,
        language: FallbackCartesiaTranscriberLanguage? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.model = model
        self.language = language
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.model = try container.decodeIfPresent(InkWhisper.self, forKey: .model)
        self.language = try container.decodeIfPresent(FallbackCartesiaTranscriberLanguage.self, forKey: .language)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encodeIfPresent(self.language, forKey: .language)
    }

    public enum InkWhisper: String, Codable, Hashable, CaseIterable, Sendable {
        case inkWhisper = "ink-whisper"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case model
        case language
    }
}