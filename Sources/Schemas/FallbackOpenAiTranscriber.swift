import Foundation

/// Fallback configuration for transcribing speech with OpenAI, including model and language.
public struct FallbackOpenAiTranscriber: Codable, Hashable, Sendable {
    /// This is the model that will be used for the transcription.
    /// Digit formatting can differ by model: `gpt-transcribe` may write spoken digit strings as words (for example, "four seven two"), where `gpt-4o-transcribe` and `gpt-4o-mini-transcribe` may write them as digits ("472"). Do not rely on either format.
    public let model: FallbackOpenAiTranscriberModel
    /// This is the language that will be set for the transcription.
    public let language: FallbackOpenAiTranscriberLanguage?
    /// These are words and phrases the model should recognize, such as names, brands, and product terms.
    /// Supported only by `gpt-transcribe`. Each keyword is one line and must not contain `<` or `>`. Maximum 16,384 keywords.
    public let keywords: [String]?
    /// This is free-text context for the transcription, such as the topic of the call or the expected vocabulary.
    /// Maximum length: 8,192 characters for `gpt-transcribe`, and 1,024 characters for `gpt-4o-transcribe` and `gpt-4o-mini-transcribe`.
    public let prompt: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        model: FallbackOpenAiTranscriberModel,
        language: FallbackOpenAiTranscriberLanguage? = nil,
        keywords: [String]? = nil,
        prompt: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.model = model
        self.language = language
        self.keywords = keywords
        self.prompt = prompt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.model = try container.decode(FallbackOpenAiTranscriberModel.self, forKey: .model)
        self.language = try container.decodeIfPresent(FallbackOpenAiTranscriberLanguage.self, forKey: .language)
        self.keywords = try container.decodeIfPresent([String].self, forKey: .keywords)
        self.prompt = try container.decodeIfPresent(String.self, forKey: .prompt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.model, forKey: .model)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.keywords, forKey: .keywords)
        try container.encodeIfPresent(self.prompt, forKey: .prompt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case model
        case language
        case keywords
        case prompt
    }
}