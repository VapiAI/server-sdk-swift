import Foundation

public struct SonioxTranscriber: Codable, Hashable, Sendable {
    /// The Soniox model to use for transcription.
    public let model: SonioxTranscriberModel?
    /// The language for transcription. Uses ISO 639-1 codes. Soniox supports 60+ languages with a single universal model.
    public let language: SonioxTranscriberLanguage?
    /// When enabled, restricts transcription to the language specified in the language field. When disabled, the model can detect and transcribe any of 60+ supported languages. Defaults to true.
    public let languageHintsStrict: Bool?
    /// Maximum delay in milliseconds between when the speaker stops and when the endpoint is detected. Lower values mean faster turn-taking but more false endpoints. Range: 500-3000. Default: 500.
    public let maxEndpointDelayMs: Double?
    /// Custom vocabulary terms to boost recognition accuracy. Useful for brand names, product names, and domain-specific terminology. Maps to Soniox context.terms.
    public let customVocabulary: [String]?
    /// This is the plan for transcriber provider fallbacks in the event that the primary transcriber provider fails.
    public let fallbackPlan: FallbackTranscriberPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        model: SonioxTranscriberModel? = nil,
        language: SonioxTranscriberLanguage? = nil,
        languageHintsStrict: Bool? = nil,
        maxEndpointDelayMs: Double? = nil,
        customVocabulary: [String]? = nil,
        fallbackPlan: FallbackTranscriberPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.model = model
        self.language = language
        self.languageHintsStrict = languageHintsStrict
        self.maxEndpointDelayMs = maxEndpointDelayMs
        self.customVocabulary = customVocabulary
        self.fallbackPlan = fallbackPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.model = try container.decodeIfPresent(SonioxTranscriberModel.self, forKey: .model)
        self.language = try container.decodeIfPresent(SonioxTranscriberLanguage.self, forKey: .language)
        self.languageHintsStrict = try container.decodeIfPresent(Bool.self, forKey: .languageHintsStrict)
        self.maxEndpointDelayMs = try container.decodeIfPresent(Double.self, forKey: .maxEndpointDelayMs)
        self.customVocabulary = try container.decodeIfPresent([String].self, forKey: .customVocabulary)
        self.fallbackPlan = try container.decodeIfPresent(FallbackTranscriberPlan.self, forKey: .fallbackPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.languageHintsStrict, forKey: .languageHintsStrict)
        try container.encodeIfPresent(self.maxEndpointDelayMs, forKey: .maxEndpointDelayMs)
        try container.encodeIfPresent(self.customVocabulary, forKey: .customVocabulary)
        try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case model
        case language
        case languageHintsStrict
        case maxEndpointDelayMs
        case customVocabulary
        case fallbackPlan
    }
}