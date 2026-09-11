import Foundation

public struct XaiVoice: Codable, Hashable, Sendable {
    /// This is the flag to toggle voice caching for the assistant.
    public let cachingEnabled: Bool?
    /// Built-in voices: eve, ara, rex, sal, leo. Cloned voice IDs are also accepted.
    public let voiceId: XaiVoiceVoiceId
    /// BCP-47 language code for xAI TTS synthesis.
    public let language: XaiVoiceLanguage?
    /// Speed multiplier for xAI TTS synthesis.
    public let speed: Double?
    /// This is the plan for chunking the model output before it is sent to the voice provider.
    public let chunkPlan: ChunkPlan?
    /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
    public let fallbackPlan: FallbackPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cachingEnabled: Bool? = nil,
        voiceId: XaiVoiceVoiceId,
        language: XaiVoiceLanguage? = nil,
        speed: Double? = nil,
        chunkPlan: ChunkPlan? = nil,
        fallbackPlan: FallbackPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cachingEnabled = cachingEnabled
        self.voiceId = voiceId
        self.language = language
        self.speed = speed
        self.chunkPlan = chunkPlan
        self.fallbackPlan = fallbackPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
        self.voiceId = try container.decode(XaiVoiceVoiceId.self, forKey: .voiceId)
        self.language = try container.decodeIfPresent(XaiVoiceLanguage.self, forKey: .language)
        self.speed = try container.decodeIfPresent(Double.self, forKey: .speed)
        self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
        self.fallbackPlan = try container.decodeIfPresent(FallbackPlan.self, forKey: .fallbackPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
        try container.encode(self.voiceId, forKey: .voiceId)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.speed, forKey: .speed)
        try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
        try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cachingEnabled
        case voiceId
        case language
        case speed
        case chunkPlan
        case fallbackPlan
    }
}