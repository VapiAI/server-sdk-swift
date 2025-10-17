import Foundation

public struct FallbackAssemblyAiTranscriber: Codable, Hashable, Sendable {
    /// This is the language that will be set for the transcription.
    public let language: En?
    /// Transcripts below this confidence threshold will be discarded.
    /// 
    /// @default 0.4
    public let confidenceThreshold: Double?
    /// This enables formatting of transcripts.
    /// 
    /// @default true
    public let formatTurns: Bool?
    /// This is the end of turn confidence threshold. The minimum confidence that the end of turn is detected.
    /// Note: Only used if startSpeakingPlan.smartEndpointingPlan is not set.
    /// @min 0
    /// @max 1
    /// @default 0.7
    public let endOfTurnConfidenceThreshold: Double?
    /// This is the minimum end of turn silence when confident in milliseconds.
    /// Note: Only used if startSpeakingPlan.smartEndpointingPlan is not set.
    /// @default 160
    public let minEndOfTurnSilenceWhenConfident: Double?
    public let wordFinalizationMaxWaitTime: Double?
    /// This is the maximum turn silence time in milliseconds.
    /// Note: Only used if startSpeakingPlan.smartEndpointingPlan is not set.
    /// @default 400
    public let maxTurnSilence: Double?
    /// The WebSocket URL that the transcriber connects to.
    public let realtimeUrl: String?
    /// Add up to 2500 characters of custom vocabulary.
    public let wordBoost: [String]?
    /// Keyterms prompting improves recognition accuracy for specific words and phrases.
    /// Can include up to 100 keyterms, each up to 50 characters.
    /// Costs an additional $0.04/hour when enabled.
    public let keytermsPrompt: [String]?
    /// The duration of the end utterance silence threshold in milliseconds.
    public let endUtteranceSilenceThreshold: Double?
    /// Disable partial transcripts.
    /// Set to `true` to not receive partial transcripts. Defaults to `false`.
    public let disablePartialTranscripts: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        language: En? = nil,
        confidenceThreshold: Double? = nil,
        formatTurns: Bool? = nil,
        endOfTurnConfidenceThreshold: Double? = nil,
        minEndOfTurnSilenceWhenConfident: Double? = nil,
        wordFinalizationMaxWaitTime: Double? = nil,
        maxTurnSilence: Double? = nil,
        realtimeUrl: String? = nil,
        wordBoost: [String]? = nil,
        keytermsPrompt: [String]? = nil,
        endUtteranceSilenceThreshold: Double? = nil,
        disablePartialTranscripts: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.language = language
        self.confidenceThreshold = confidenceThreshold
        self.formatTurns = formatTurns
        self.endOfTurnConfidenceThreshold = endOfTurnConfidenceThreshold
        self.minEndOfTurnSilenceWhenConfident = minEndOfTurnSilenceWhenConfident
        self.wordFinalizationMaxWaitTime = wordFinalizationMaxWaitTime
        self.maxTurnSilence = maxTurnSilence
        self.realtimeUrl = realtimeUrl
        self.wordBoost = wordBoost
        self.keytermsPrompt = keytermsPrompt
        self.endUtteranceSilenceThreshold = endUtteranceSilenceThreshold
        self.disablePartialTranscripts = disablePartialTranscripts
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.language = try container.decodeIfPresent(En.self, forKey: .language)
        self.confidenceThreshold = try container.decodeIfPresent(Double.self, forKey: .confidenceThreshold)
        self.formatTurns = try container.decodeIfPresent(Bool.self, forKey: .formatTurns)
        self.endOfTurnConfidenceThreshold = try container.decodeIfPresent(Double.self, forKey: .endOfTurnConfidenceThreshold)
        self.minEndOfTurnSilenceWhenConfident = try container.decodeIfPresent(Double.self, forKey: .minEndOfTurnSilenceWhenConfident)
        self.wordFinalizationMaxWaitTime = try container.decodeIfPresent(Double.self, forKey: .wordFinalizationMaxWaitTime)
        self.maxTurnSilence = try container.decodeIfPresent(Double.self, forKey: .maxTurnSilence)
        self.realtimeUrl = try container.decodeIfPresent(String.self, forKey: .realtimeUrl)
        self.wordBoost = try container.decodeIfPresent([String].self, forKey: .wordBoost)
        self.keytermsPrompt = try container.decodeIfPresent([String].self, forKey: .keytermsPrompt)
        self.endUtteranceSilenceThreshold = try container.decodeIfPresent(Double.self, forKey: .endUtteranceSilenceThreshold)
        self.disablePartialTranscripts = try container.decodeIfPresent(Bool.self, forKey: .disablePartialTranscripts)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.confidenceThreshold, forKey: .confidenceThreshold)
        try container.encodeIfPresent(self.formatTurns, forKey: .formatTurns)
        try container.encodeIfPresent(self.endOfTurnConfidenceThreshold, forKey: .endOfTurnConfidenceThreshold)
        try container.encodeIfPresent(self.minEndOfTurnSilenceWhenConfident, forKey: .minEndOfTurnSilenceWhenConfident)
        try container.encodeIfPresent(self.wordFinalizationMaxWaitTime, forKey: .wordFinalizationMaxWaitTime)
        try container.encodeIfPresent(self.maxTurnSilence, forKey: .maxTurnSilence)
        try container.encodeIfPresent(self.realtimeUrl, forKey: .realtimeUrl)
        try container.encodeIfPresent(self.wordBoost, forKey: .wordBoost)
        try container.encodeIfPresent(self.keytermsPrompt, forKey: .keytermsPrompt)
        try container.encodeIfPresent(self.endUtteranceSilenceThreshold, forKey: .endUtteranceSilenceThreshold)
        try container.encodeIfPresent(self.disablePartialTranscripts, forKey: .disablePartialTranscripts)
    }

    public enum En: String, Codable, Hashable, CaseIterable, Sendable {
        case en
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case language
        case confidenceThreshold
        case formatTurns
        case endOfTurnConfidenceThreshold
        case minEndOfTurnSilenceWhenConfident
        case wordFinalizationMaxWaitTime
        case maxTurnSilence
        case realtimeUrl
        case wordBoost
        case keytermsPrompt
        case endUtteranceSilenceThreshold
        case disablePartialTranscripts
    }
}