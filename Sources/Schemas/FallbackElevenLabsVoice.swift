import Foundation

public struct FallbackElevenLabsVoice: Codable, Hashable, Sendable {
    /// This is the flag to toggle voice caching for the assistant.
    public let cachingEnabled: Bool?
    /// This is the provider-specific ID that will be used. Ensure the Voice is present in your 11Labs Voice Library.
    public let voiceId: FallbackElevenLabsVoiceId
    /// Defines the stability for voice settings.
    public let stability: Double?
    /// Defines the similarity boost for voice settings.
    public let similarityBoost: Double?
    /// Defines the style for voice settings.
    public let style: Double?
    /// Defines the use speaker boost for voice settings.
    public let useSpeakerBoost: Bool?
    /// Defines the speed for voice settings.
    public let speed: Double?
    /// Defines the optimize streaming latency for voice settings. Defaults to 3.
    public let optimizeStreamingLatency: Double?
    /// This enables the use of https://elevenlabs.io/docs/speech-synthesis/prompting#pronunciation. Defaults to false to save latency.
    /// 
    /// @default false
    public let enableSsmlParsing: Bool?
    /// Defines the auto mode for voice settings. Defaults to false.
    public let autoMode: Bool?
    /// This is the model that will be used. Defaults to 'eleven_turbo_v2' if not specified.
    public let model: FallbackElevenLabsVoiceModel?
    /// This is the language (ISO 639-1) that is enforced for the model. Currently only Turbo v2.5 supports language enforcement. For other models, an error will be returned if language code is provided.
    public let language: String?
    /// This is the pronunciation dictionary locators to use.
    public let pronunciationDictionaryLocators: [ElevenLabsPronunciationDictionaryLocator]?
    /// This is the plan for chunking the model output before it is sent to the voice provider.
    public let chunkPlan: ChunkPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cachingEnabled: Bool? = nil,
        voiceId: FallbackElevenLabsVoiceId,
        stability: Double? = nil,
        similarityBoost: Double? = nil,
        style: Double? = nil,
        useSpeakerBoost: Bool? = nil,
        speed: Double? = nil,
        optimizeStreamingLatency: Double? = nil,
        enableSsmlParsing: Bool? = nil,
        autoMode: Bool? = nil,
        model: FallbackElevenLabsVoiceModel? = nil,
        language: String? = nil,
        pronunciationDictionaryLocators: [ElevenLabsPronunciationDictionaryLocator]? = nil,
        chunkPlan: ChunkPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cachingEnabled = cachingEnabled
        self.voiceId = voiceId
        self.stability = stability
        self.similarityBoost = similarityBoost
        self.style = style
        self.useSpeakerBoost = useSpeakerBoost
        self.speed = speed
        self.optimizeStreamingLatency = optimizeStreamingLatency
        self.enableSsmlParsing = enableSsmlParsing
        self.autoMode = autoMode
        self.model = model
        self.language = language
        self.pronunciationDictionaryLocators = pronunciationDictionaryLocators
        self.chunkPlan = chunkPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
        self.voiceId = try container.decode(FallbackElevenLabsVoiceId.self, forKey: .voiceId)
        self.stability = try container.decodeIfPresent(Double.self, forKey: .stability)
        self.similarityBoost = try container.decodeIfPresent(Double.self, forKey: .similarityBoost)
        self.style = try container.decodeIfPresent(Double.self, forKey: .style)
        self.useSpeakerBoost = try container.decodeIfPresent(Bool.self, forKey: .useSpeakerBoost)
        self.speed = try container.decodeIfPresent(Double.self, forKey: .speed)
        self.optimizeStreamingLatency = try container.decodeIfPresent(Double.self, forKey: .optimizeStreamingLatency)
        self.enableSsmlParsing = try container.decodeIfPresent(Bool.self, forKey: .enableSsmlParsing)
        self.autoMode = try container.decodeIfPresent(Bool.self, forKey: .autoMode)
        self.model = try container.decodeIfPresent(FallbackElevenLabsVoiceModel.self, forKey: .model)
        self.language = try container.decodeIfPresent(String.self, forKey: .language)
        self.pronunciationDictionaryLocators = try container.decodeIfPresent([ElevenLabsPronunciationDictionaryLocator].self, forKey: .pronunciationDictionaryLocators)
        self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
        try container.encode(self.voiceId, forKey: .voiceId)
        try container.encodeIfPresent(self.stability, forKey: .stability)
        try container.encodeIfPresent(self.similarityBoost, forKey: .similarityBoost)
        try container.encodeIfPresent(self.style, forKey: .style)
        try container.encodeIfPresent(self.useSpeakerBoost, forKey: .useSpeakerBoost)
        try container.encodeIfPresent(self.speed, forKey: .speed)
        try container.encodeIfPresent(self.optimizeStreamingLatency, forKey: .optimizeStreamingLatency)
        try container.encodeIfPresent(self.enableSsmlParsing, forKey: .enableSsmlParsing)
        try container.encodeIfPresent(self.autoMode, forKey: .autoMode)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.pronunciationDictionaryLocators, forKey: .pronunciationDictionaryLocators)
        try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cachingEnabled
        case voiceId
        case stability
        case similarityBoost
        case style
        case useSpeakerBoost
        case speed
        case optimizeStreamingLatency
        case enableSsmlParsing
        case autoMode
        case model
        case language
        case pronunciationDictionaryLocators
        case chunkPlan
    }
}