import Foundation

public struct FallbackTalkscriberTranscriber: Codable, Hashable, Sendable {
    /// This is the model that will be used for the transcription.
    public let model: Whisper?
    /// This is the language that will be set for the transcription. The list of languages Whisper supports can be found here: https://github.com/openai/whisper/blob/main/whisper/tokenizer.py
    public let language: FallbackTalkscriberTranscriberLanguage?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        model: Whisper? = nil,
        language: FallbackTalkscriberTranscriberLanguage? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.model = model
        self.language = language
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.model = try container.decodeIfPresent(Whisper.self, forKey: .model)
        self.language = try container.decodeIfPresent(FallbackTalkscriberTranscriberLanguage.self, forKey: .language)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encodeIfPresent(self.language, forKey: .language)
    }

    public enum Whisper: String, Codable, Hashable, CaseIterable, Sendable {
        case whisper
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case model
        case language
    }
}