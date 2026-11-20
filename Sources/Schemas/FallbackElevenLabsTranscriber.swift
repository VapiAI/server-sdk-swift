import Foundation

/// Fallback configuration for transcribing speech with ElevenLabs, including model, language, and speech thresholds.
public struct FallbackElevenLabsTranscriber: Codable, Hashable, Sendable {
    /// This is the model that will be used for the transcription.
    public let model: FallbackElevenLabsTranscriberModel?
    /// This is the language that will be used for the transcription.
    public let language: FallbackElevenLabsTranscriberLanguage?
    /// Words or phrases to bias the transcription towards, such as product names. Supported on scribe_v2 (up to 100 terms of 50 characters each) and scribe_v2_realtime (up to 50 terms of 20 characters each). Each term has at most 5 words and none of `< > { } [ ] \`. Adds ElevenLabs' keyterm prompting rate to the transcriber cost.
    public let keyterms: [String]?
    /// This is the number of seconds of silence before VAD commits (0.3-3.0).
    public let silenceThresholdSeconds: Double?
    /// This is the VAD sensitivity (0.1-0.9, lower indicates more sensitive).
    public let confidenceThreshold: Double?
    /// This is the minimum speech duration for VAD (50-2000ms).
    public let minSpeechDurationMs: Double?
    /// This is the minimum silence duration for VAD (50-2000ms).
    public let minSilenceDurationMs: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        model: FallbackElevenLabsTranscriberModel? = nil,
        language: FallbackElevenLabsTranscriberLanguage? = nil,
        keyterms: [String]? = nil,
        silenceThresholdSeconds: Double? = nil,
        confidenceThreshold: Double? = nil,
        minSpeechDurationMs: Double? = nil,
        minSilenceDurationMs: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.model = model
        self.language = language
        self.keyterms = keyterms
        self.silenceThresholdSeconds = silenceThresholdSeconds
        self.confidenceThreshold = confidenceThreshold
        self.minSpeechDurationMs = minSpeechDurationMs
        self.minSilenceDurationMs = minSilenceDurationMs
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.model = try container.decodeIfPresent(FallbackElevenLabsTranscriberModel.self, forKey: .model)
        self.language = try container.decodeIfPresent(FallbackElevenLabsTranscriberLanguage.self, forKey: .language)
        self.keyterms = try container.decodeIfPresent([String].self, forKey: .keyterms)
        self.silenceThresholdSeconds = try container.decodeIfPresent(Double.self, forKey: .silenceThresholdSeconds)
        self.confidenceThreshold = try container.decodeIfPresent(Double.self, forKey: .confidenceThreshold)
        self.minSpeechDurationMs = try container.decodeIfPresent(Double.self, forKey: .minSpeechDurationMs)
        self.minSilenceDurationMs = try container.decodeIfPresent(Double.self, forKey: .minSilenceDurationMs)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.keyterms, forKey: .keyterms)
        try container.encodeIfPresent(self.silenceThresholdSeconds, forKey: .silenceThresholdSeconds)
        try container.encodeIfPresent(self.confidenceThreshold, forKey: .confidenceThreshold)
        try container.encodeIfPresent(self.minSpeechDurationMs, forKey: .minSpeechDurationMs)
        try container.encodeIfPresent(self.minSilenceDurationMs, forKey: .minSilenceDurationMs)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case model
        case language
        case keyterms
        case silenceThresholdSeconds
        case confidenceThreshold
        case minSpeechDurationMs
        case minSilenceDurationMs
    }
}