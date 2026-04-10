import Foundation

public struct ElevenLabsTranscriber: Codable, Hashable, Sendable {
    /// This is the model that will be used for the transcription.
    public let model: ElevenLabsTranscriberModel?
    /// This is the language that will be used for the transcription.
    public let language: ElevenLabsTranscriberLanguage?
    /// This is the number of seconds of silence before VAD commits (0.3-3.0).
    public let silenceThresholdSeconds: Double?
    /// This is the VAD sensitivity (0.1-0.9, lower indicates more sensitive).
    public let confidenceThreshold: Double?
    /// This is the minimum speech duration for VAD (50-2000ms).
    public let minSpeechDurationMs: Double?
    /// This is the minimum silence duration for VAD (50-2000ms).
    public let minSilenceDurationMs: Double?
    /// This is the plan for transcriber provider fallbacks in the event that the primary transcriber provider fails.
    public let fallbackPlan: FallbackTranscriberPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        model: ElevenLabsTranscriberModel? = nil,
        language: ElevenLabsTranscriberLanguage? = nil,
        silenceThresholdSeconds: Double? = nil,
        confidenceThreshold: Double? = nil,
        minSpeechDurationMs: Double? = nil,
        minSilenceDurationMs: Double? = nil,
        fallbackPlan: FallbackTranscriberPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.model = model
        self.language = language
        self.silenceThresholdSeconds = silenceThresholdSeconds
        self.confidenceThreshold = confidenceThreshold
        self.minSpeechDurationMs = minSpeechDurationMs
        self.minSilenceDurationMs = minSilenceDurationMs
        self.fallbackPlan = fallbackPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.model = try container.decodeIfPresent(ElevenLabsTranscriberModel.self, forKey: .model)
        self.language = try container.decodeIfPresent(ElevenLabsTranscriberLanguage.self, forKey: .language)
        self.silenceThresholdSeconds = try container.decodeIfPresent(Double.self, forKey: .silenceThresholdSeconds)
        self.confidenceThreshold = try container.decodeIfPresent(Double.self, forKey: .confidenceThreshold)
        self.minSpeechDurationMs = try container.decodeIfPresent(Double.self, forKey: .minSpeechDurationMs)
        self.minSilenceDurationMs = try container.decodeIfPresent(Double.self, forKey: .minSilenceDurationMs)
        self.fallbackPlan = try container.decodeIfPresent(FallbackTranscriberPlan.self, forKey: .fallbackPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.silenceThresholdSeconds, forKey: .silenceThresholdSeconds)
        try container.encodeIfPresent(self.confidenceThreshold, forKey: .confidenceThreshold)
        try container.encodeIfPresent(self.minSpeechDurationMs, forKey: .minSpeechDurationMs)
        try container.encodeIfPresent(self.minSilenceDurationMs, forKey: .minSilenceDurationMs)
        try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case model
        case language
        case silenceThresholdSeconds
        case confidenceThreshold
        case minSpeechDurationMs
        case minSilenceDurationMs
        case fallbackPlan
    }
}