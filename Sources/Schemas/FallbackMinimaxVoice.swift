import Foundation

public struct FallbackMinimaxVoice: Codable, Hashable, Sendable {
    /// This is the flag to toggle voice caching for the assistant.
    public let cachingEnabled: Bool?
    /// This is the voice provider that will be used.
    public let provider: Minimax
    /// This is the provider-specific ID that will be used. Use a voice from MINIMAX_PREDEFINED_VOICES or a custom cloned voice ID.
    public let voiceId: String
    /// This is the model that will be used. Options are 'speech-02-hd' and 'speech-02-turbo'.
    /// speech-02-hd is optimized for high-fidelity applications like voiceovers and audiobooks.
    /// speech-02-turbo is designed for real-time applications with low latency.
    /// 
    /// @default "speech-02-turbo"
    public let model: FallbackMinimaxVoiceModel?
    /// The emotion to use for the voice. If not provided, will use auto-detect mode.
    /// Options include: 'happy', 'sad', 'angry', 'fearful', 'surprised', 'disgusted', 'neutral'
    public let emotion: String?
    /// Voice pitch adjustment. Range from -12 to 12 semitones.
    /// @default 0
    public let pitch: Double?
    /// Voice speed adjustment. Range from 0.5 to 2.0.
    /// @default 1.0
    public let speed: Double?
    /// Voice volume adjustment. Range from 0.5 to 2.0.
    /// @default 1.0
    public let volume: Double?
    /// The region for Minimax API. Defaults to "worldwide".
    public let region: FallbackMinimaxVoiceRegion?
    /// Language hint for MiniMax T2A. Example: yue (Cantonese), zh (Chinese), en (English).
    public let languageBoost: FallbackMinimaxVoiceLanguageBoost?
    /// Enable MiniMax text normalization to improve number reading and formatting.
    public let textNormalizationEnabled: Bool?
    /// This is the plan for chunking the model output before it is sent to the voice provider.
    public let chunkPlan: ChunkPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cachingEnabled: Bool? = nil,
        provider: Minimax,
        voiceId: String,
        model: FallbackMinimaxVoiceModel? = nil,
        emotion: String? = nil,
        pitch: Double? = nil,
        speed: Double? = nil,
        volume: Double? = nil,
        region: FallbackMinimaxVoiceRegion? = nil,
        languageBoost: FallbackMinimaxVoiceLanguageBoost? = nil,
        textNormalizationEnabled: Bool? = nil,
        chunkPlan: ChunkPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cachingEnabled = cachingEnabled
        self.provider = provider
        self.voiceId = voiceId
        self.model = model
        self.emotion = emotion
        self.pitch = pitch
        self.speed = speed
        self.volume = volume
        self.region = region
        self.languageBoost = languageBoost
        self.textNormalizationEnabled = textNormalizationEnabled
        self.chunkPlan = chunkPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
        self.provider = try container.decode(Minimax.self, forKey: .provider)
        self.voiceId = try container.decode(String.self, forKey: .voiceId)
        self.model = try container.decodeIfPresent(FallbackMinimaxVoiceModel.self, forKey: .model)
        self.emotion = try container.decodeIfPresent(String.self, forKey: .emotion)
        self.pitch = try container.decodeIfPresent(Double.self, forKey: .pitch)
        self.speed = try container.decodeIfPresent(Double.self, forKey: .speed)
        self.volume = try container.decodeIfPresent(Double.self, forKey: .volume)
        self.region = try container.decodeIfPresent(FallbackMinimaxVoiceRegion.self, forKey: .region)
        self.languageBoost = try container.decodeIfPresent(FallbackMinimaxVoiceLanguageBoost.self, forKey: .languageBoost)
        self.textNormalizationEnabled = try container.decodeIfPresent(Bool.self, forKey: .textNormalizationEnabled)
        self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
        try container.encode(self.provider, forKey: .provider)
        try container.encode(self.voiceId, forKey: .voiceId)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encodeIfPresent(self.emotion, forKey: .emotion)
        try container.encodeIfPresent(self.pitch, forKey: .pitch)
        try container.encodeIfPresent(self.speed, forKey: .speed)
        try container.encodeIfPresent(self.volume, forKey: .volume)
        try container.encodeIfPresent(self.region, forKey: .region)
        try container.encodeIfPresent(self.languageBoost, forKey: .languageBoost)
        try container.encodeIfPresent(self.textNormalizationEnabled, forKey: .textNormalizationEnabled)
        try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
    }

    public enum Minimax: String, Codable, Hashable, CaseIterable, Sendable {
        case minimax
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cachingEnabled
        case provider
        case voiceId
        case model
        case emotion
        case pitch
        case speed
        case volume
        case region
        case languageBoost
        case textNormalizationEnabled
        case chunkPlan
    }
}