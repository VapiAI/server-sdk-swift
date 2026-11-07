import Foundation

/// Configuration for transcribing speech during assistant conversations with Soniox, including model, language detection, endpointing, vocabulary, and fallback settings.
public struct SonioxTranscriber: Codable, Hashable, Sendable {
    /// The Soniox model to use for transcription.
    public let model: SonioxTranscriberModel?
    /// Single language for transcription as an ISO 639-1 code (e.g., `en`, `es`). For multi-language hints or to enable Soniox auto-detect, use `languages` instead — when `languages` is set (including to an empty array), this field is ignored when building the Soniox request. Defaults to `en` if neither this nor `languages` is set.
    public let language: SonioxTranscriberLanguage?
    /// Language hints sent to Soniox as `language_hints`. Provide `[lang1, lang2, ...]` (ISO 639-1 codes) to bias recognition toward specific languages, or provide an explicit empty array `[]` to enable Soniox auto-detect across all 60+ supported languages. When set (including the empty array), this field takes precedence over the singular `language` field. When omitted, falls back to the singular `language` (which defaults to `en` if also unset). Best accuracy is achieved with a single language.
    public let languages: [SonioxTranscriberLanguagesItem]?
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
    /// Transcripts below this confidence are discarded. For a discarded final, an `assistant.transcriber.endpointedSpeechLowConfidence` hook whose range covers the confidence runs (by default `[threshold - 0.2, threshold)`); if none does, the assistant does not respond to that utterance. Confidence is the mean of the per-token scores, and a transcript with an unscored token counts as 1. When unset, nothing is discarded by this setting.
    public let confidenceThreshold: Double?
    /// This is the plan for transcriber provider fallbacks in the event that the primary transcriber provider fails.
    public let fallbackPlan: FallbackTranscriberPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        model: SonioxTranscriberModel? = nil,
        language: SonioxTranscriberLanguage? = nil,
        languages: [SonioxTranscriberLanguagesItem]? = nil,
        languageHintsStrict: Bool? = nil,
        maxEndpointDelayMs: Double? = nil,
        endpointSensitivity: Double? = nil,
        endpointLatencyAdjustmentLevel: Double? = nil,
        customVocabulary: [String]? = nil,
        contextGeneral: [SonioxContextGeneralItem]? = nil,
        confidenceThreshold: Double? = nil,
        fallbackPlan: FallbackTranscriberPlan? = nil,
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
        self.confidenceThreshold = confidenceThreshold
        self.fallbackPlan = fallbackPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.model = try container.decodeIfPresent(SonioxTranscriberModel.self, forKey: .model)
        self.language = try container.decodeIfPresent(SonioxTranscriberLanguage.self, forKey: .language)
        self.languages = try container.decodeIfPresent([SonioxTranscriberLanguagesItem].self, forKey: .languages)
        self.languageHintsStrict = try container.decodeIfPresent(Bool.self, forKey: .languageHintsStrict)
        self.maxEndpointDelayMs = try container.decodeIfPresent(Double.self, forKey: .maxEndpointDelayMs)
        self.endpointSensitivity = try container.decodeIfPresent(Double.self, forKey: .endpointSensitivity)
        self.endpointLatencyAdjustmentLevel = try container.decodeIfPresent(Double.self, forKey: .endpointLatencyAdjustmentLevel)
        self.customVocabulary = try container.decodeIfPresent([String].self, forKey: .customVocabulary)
        self.contextGeneral = try container.decodeIfPresent([SonioxContextGeneralItem].self, forKey: .contextGeneral)
        self.confidenceThreshold = try container.decodeIfPresent(Double.self, forKey: .confidenceThreshold)
        self.fallbackPlan = try container.decodeIfPresent(FallbackTranscriberPlan.self, forKey: .fallbackPlan)
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
        try container.encodeIfPresent(self.confidenceThreshold, forKey: .confidenceThreshold)
        try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
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
        case confidenceThreshold
        case fallbackPlan
    }
}