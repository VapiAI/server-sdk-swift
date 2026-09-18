import Foundation

/// Fallback configuration for transcribing speech with Soniox, including model, language detection, endpointing, and vocabulary.
public struct FallbackSonioxTranscriber: Codable, Hashable, Sendable {
    /// The Soniox model to use for transcription.
    public let model: FallbackSonioxTranscriberModel?
    /// Single language for transcription as an ISO 639-1 code (e.g., `en`, `es`). For multi-language hints or to enable Soniox auto-detect, use `languages` instead — when `languages` is set (including to an empty array), this field is ignored when building the Soniox request. Defaults to `en` if neither this nor `languages` is set.
    public let language: FallbackSonioxTranscriberLanguage?
    /// Language hints sent to Soniox as `language_hints`. Provide `[lang1, lang2, ...]` (ISO 639-1 codes) to bias recognition toward specific languages, or provide an explicit empty array `[]` to enable Soniox auto-detect across all 60+ supported languages. When set (including the empty array), this field takes precedence over the singular `language` field. When omitted, falls back to the singular `language` (which defaults to `en` if also unset). Best accuracy is achieved with a single language.
    public let languages: [FallbackSonioxTranscriberLanguagesItem]?
    /// When `true`, Soniox strictly restricts transcription to the languages in `languages` (or the singular `language` if `languages` is unset). When `false`, Soniox biases toward those languages but still allows transcription in other languages. Has no effect when no language hints are sent (e.g., `languages: []` for auto-detect). Defaults to `true` (strict mode).
    public let languageHintsStrict: Bool?
    /// Maximum delay in milliseconds between when the speaker stops and when the endpoint is detected. Lower values mean faster turn-taking but more false endpoints. Range: 500-3000. Default: 500.
    public let maxEndpointDelayMs: Double?
    /// How likely Soniox is to emit an endpoint (end the caller turn). Higher values make endpoints more likely for faster turn-taking; negative values make them less likely, which helps when callers pause mid-sentence (e.g. reading numbers group by group). Range: -1.0 to 1.0. Default: 0.3 (the platform low-latency voice profile; Soniox's own default is 0.0). Supported by stt-rt-v5; omitted from the Soniox request on explicit stt-rt-v4. Soniox recommends tuning endpointLatencyAdjustmentLevel first, and advises against negative sensitivity while the level is above 0 (the settings work against each other).
    public let endpointSensitivity: Double?
    /// How aggressively Soniox reduces endpoint latency. 0 is Soniox's default semantic endpointing; 3 is the most aggressive. Higher levels return endpoints sooner but may split speech into more segments and slightly reduce accuracy. Integer. Range: 0-3. Default: 2 (the platform low-latency voice profile; Soniox's own default is 0). Supported by stt-rt-v5; omitted from the Soniox request on explicit stt-rt-v4.
    public let endpointLatencyAdjustmentLevel: Double?
    /// Custom vocabulary terms to boost recognition accuracy. Useful for brand names, product names, and domain-specific terminology. Maps to Soniox context.terms.
    public let customVocabulary: [String]?
    /// General context key-value pairs that guide the AI model during transcription. Helps adapt vocabulary to the correct domain, improving accuracy. Recommended: 10 or fewer pairs. Maps to Soniox context.general.
    public let contextGeneral: [SonioxContextGeneralItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        model: FallbackSonioxTranscriberModel? = nil,
        language: FallbackSonioxTranscriberLanguage? = nil,
        languages: [FallbackSonioxTranscriberLanguagesItem]? = nil,
        languageHintsStrict: Bool? = nil,
        maxEndpointDelayMs: Double? = nil,
        endpointSensitivity: Double? = nil,
        endpointLatencyAdjustmentLevel: Double? = nil,
        customVocabulary: [String]? = nil,
        contextGeneral: [SonioxContextGeneralItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.model = model
        self.language = language
        self.languages = languages
        self.languageHintsStrict = languageHintsStrict
        self.maxEndpointDelayMs = maxEndpointDelayMs
        self.endpointSensitivity = endpointSensitivity
        self.endpointLatencyAdjustmentLevel = endpointLatencyAdjustmentLevel
        self.customVocabulary = customVocabulary
        self.contextGeneral = contextGeneral
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.model = try container.decodeIfPresent(FallbackSonioxTranscriberModel.self, forKey: .model)
        self.language = try container.decodeIfPresent(FallbackSonioxTranscriberLanguage.self, forKey: .language)
        self.languages = try container.decodeIfPresent([FallbackSonioxTranscriberLanguagesItem].self, forKey: .languages)
        self.languageHintsStrict = try container.decodeIfPresent(Bool.self, forKey: .languageHintsStrict)
        self.maxEndpointDelayMs = try container.decodeIfPresent(Double.self, forKey: .maxEndpointDelayMs)
        self.endpointSensitivity = try container.decodeIfPresent(Double.self, forKey: .endpointSensitivity)
        self.endpointLatencyAdjustmentLevel = try container.decodeIfPresent(Double.self, forKey: .endpointLatencyAdjustmentLevel)
        self.customVocabulary = try container.decodeIfPresent([String].self, forKey: .customVocabulary)
        self.contextGeneral = try container.decodeIfPresent([SonioxContextGeneralItem].self, forKey: .contextGeneral)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.languages, forKey: .languages)
        try container.encodeIfPresent(self.languageHintsStrict, forKey: .languageHintsStrict)
        try container.encodeIfPresent(self.maxEndpointDelayMs, forKey: .maxEndpointDelayMs)
        try container.encodeIfPresent(self.endpointSensitivity, forKey: .endpointSensitivity)
        try container.encodeIfPresent(self.endpointLatencyAdjustmentLevel, forKey: .endpointLatencyAdjustmentLevel)
        try container.encodeIfPresent(self.customVocabulary, forKey: .customVocabulary)
        try container.encodeIfPresent(self.contextGeneral, forKey: .contextGeneral)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case model
        case language
        case languages
        case languageHintsStrict
        case maxEndpointDelayMs
        case endpointSensitivity
        case endpointLatencyAdjustmentLevel
        case customVocabulary
        case contextGeneral
    }
}