import Foundation

/// Configuration for transcribing speech during assistant conversations with AssemblyAI, including language, streaming model, endpointing, vocabulary, and fallback settings.
public struct AssemblyAiTranscriber: Codable, Hashable, Sendable {
    /// This is the language that will be set for the transcription.
    public let language: AssemblyAiTranscriberLanguage?
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
    /// Use VAD to assist with endpointing decisions from the transcriber.
    /// When enabled, transcriber endpointing will be buffered if VAD detects the user is still speaking, preventing premature turn-taking.
    /// When disabled, transcriber endpointing will be used immediately regardless of VAD state, allowing for quicker but more aggressive turn-taking.
    /// Note: Only used if startSpeakingPlan.smartEndpointingPlan is not set.
    /// 
    /// @default true
    public let vadAssistedEndpointingEnabled: Bool?
    /// This is the transcription mode used by the `universal-3-5-pro` speech model. Only applies to the `universal-3-5-pro` speech model.
    /// 
    /// @default 'balanced'
    public let mode: AssemblyAiTranscriberMode?
    /// This is a prompt that provides additional context to the transcription model. Only applies to the `universal-3-5-pro` speech model.
    public let prompt: String?
    /// This is context about the voice agent that guides the transcription model. Only applies to the `universal-3-5-pro` speech model.
    public let agentContext: String?
    /// These are language codes used to steer automatic language detection. Only applies to the `universal-3-5-pro` speech model.
    public let languageCodes: [AssemblyAiTranscriberLanguageCodesItem]?
    /// This is the speech model used for the streaming session.
    /// Keyterms prompting is supported on universal-streaming-english and universal-3-5-pro.
    /// universal-3-5-pro is AssemblyAI's most accurate voice-agent model.
    /// @default 'universal-streaming-english'
    public let speechModel: AssemblyAiTranscriberSpeechModel?
    /// The WebSocket URL that the transcriber connects to.
    public let realtimeUrl: String?
    /// Add up to 2500 characters of custom vocabulary.
    public let wordBoost: [String]?
    /// Keyterms prompting improves recognition accuracy for specific words and phrases.
    /// Can include up to 100 keyterms, each up to 50 characters.
    /// Costs an additional $0.04/hour on universal-streaming-english and is included at no extra cost on universal-3-5-pro.
    public let keytermsPrompt: [String]?
    /// The duration of the end utterance silence threshold in milliseconds.
    public let endUtteranceSilenceThreshold: Double?
    /// Disable partial transcripts.
    /// Set to `true` to not receive partial transcripts. Defaults to `false`.
    public let disablePartialTranscripts: Bool?
    /// This is the plan for transcriber provider fallbacks in the event that the primary transcriber provider fails.
    public let fallbackPlan: FallbackTranscriberPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        language: AssemblyAiTranscriberLanguage? = nil,
        confidenceThreshold: Double? = nil,
        formatTurns: Bool? = nil,
        endOfTurnConfidenceThreshold: Double? = nil,
        minEndOfTurnSilenceWhenConfident: Double? = nil,
        wordFinalizationMaxWaitTime: Double? = nil,
        maxTurnSilence: Double? = nil,
        vadAssistedEndpointingEnabled: Bool? = nil,
        mode: AssemblyAiTranscriberMode? = nil,
        prompt: String? = nil,
        agentContext: String? = nil,
        languageCodes: [AssemblyAiTranscriberLanguageCodesItem]? = nil,
        speechModel: AssemblyAiTranscriberSpeechModel? = nil,
        realtimeUrl: String? = nil,
        wordBoost: [String]? = nil,
        keytermsPrompt: [String]? = nil,
        endUtteranceSilenceThreshold: Double? = nil,
        disablePartialTranscripts: Bool? = nil,
        fallbackPlan: FallbackTranscriberPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.language = language
        self.confidenceThreshold = confidenceThreshold
        self.formatTurns = formatTurns
        self.endOfTurnConfidenceThreshold = endOfTurnConfidenceThreshold
        self.minEndOfTurnSilenceWhenConfident = minEndOfTurnSilenceWhenConfident
        self.wordFinalizationMaxWaitTime = wordFinalizationMaxWaitTime
        self.maxTurnSilence = maxTurnSilence
        self.vadAssistedEndpointingEnabled = vadAssistedEndpointingEnabled
        self.mode = mode
        self.prompt = prompt
        self.agentContext = agentContext
        self.languageCodes = languageCodes
        self.speechModel = speechModel
        self.realtimeUrl = realtimeUrl
        self.wordBoost = wordBoost
        self.keytermsPrompt = keytermsPrompt
        self.endUtteranceSilenceThreshold = endUtteranceSilenceThreshold
        self.disablePartialTranscripts = disablePartialTranscripts
        self.fallbackPlan = fallbackPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.language = try container.decodeIfPresent(AssemblyAiTranscriberLanguage.self, forKey: .language)
        self.confidenceThreshold = try container.decodeIfPresent(Double.self, forKey: .confidenceThreshold)
        self.formatTurns = try container.decodeIfPresent(Bool.self, forKey: .formatTurns)
        self.endOfTurnConfidenceThreshold = try container.decodeIfPresent(Double.self, forKey: .endOfTurnConfidenceThreshold)
        self.minEndOfTurnSilenceWhenConfident = try container.decodeIfPresent(Double.self, forKey: .minEndOfTurnSilenceWhenConfident)
        self.wordFinalizationMaxWaitTime = try container.decodeIfPresent(Double.self, forKey: .wordFinalizationMaxWaitTime)
        self.maxTurnSilence = try container.decodeIfPresent(Double.self, forKey: .maxTurnSilence)
        self.vadAssistedEndpointingEnabled = try container.decodeIfPresent(Bool.self, forKey: .vadAssistedEndpointingEnabled)
        self.mode = try container.decodeIfPresent(AssemblyAiTranscriberMode.self, forKey: .mode)
        self.prompt = try container.decodeIfPresent(String.self, forKey: .prompt)
        self.agentContext = try container.decodeIfPresent(String.self, forKey: .agentContext)
        self.languageCodes = try container.decodeIfPresent([AssemblyAiTranscriberLanguageCodesItem].self, forKey: .languageCodes)
        self.speechModel = try container.decodeIfPresent(AssemblyAiTranscriberSpeechModel.self, forKey: .speechModel)
        self.realtimeUrl = try container.decodeIfPresent(String.self, forKey: .realtimeUrl)
        self.wordBoost = try container.decodeIfPresent([String].self, forKey: .wordBoost)
        self.keytermsPrompt = try container.decodeIfPresent([String].self, forKey: .keytermsPrompt)
        self.endUtteranceSilenceThreshold = try container.decodeIfPresent(Double.self, forKey: .endUtteranceSilenceThreshold)
        self.disablePartialTranscripts = try container.decodeIfPresent(Bool.self, forKey: .disablePartialTranscripts)
        self.fallbackPlan = try container.decodeIfPresent(FallbackTranscriberPlan.self, forKey: .fallbackPlan)
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
        try container.encodeIfPresent(self.vadAssistedEndpointingEnabled, forKey: .vadAssistedEndpointingEnabled)
        try container.encodeIfPresent(self.mode, forKey: .mode)
        try container.encodeIfPresent(self.prompt, forKey: .prompt)
        try container.encodeIfPresent(self.agentContext, forKey: .agentContext)
        try container.encodeIfPresent(self.languageCodes, forKey: .languageCodes)
        try container.encodeIfPresent(self.speechModel, forKey: .speechModel)
        try container.encodeIfPresent(self.realtimeUrl, forKey: .realtimeUrl)
        try container.encodeIfPresent(self.wordBoost, forKey: .wordBoost)
        try container.encodeIfPresent(self.keytermsPrompt, forKey: .keytermsPrompt)
        try container.encodeIfPresent(self.endUtteranceSilenceThreshold, forKey: .endUtteranceSilenceThreshold)
        try container.encodeIfPresent(self.disablePartialTranscripts, forKey: .disablePartialTranscripts)
        try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
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
        case vadAssistedEndpointingEnabled
        case mode
        case prompt
        case agentContext
        case languageCodes
        case speechModel
        case realtimeUrl
        case wordBoost
        case keytermsPrompt
        case endUtteranceSilenceThreshold
        case disablePartialTranscripts
        case fallbackPlan
    }
}