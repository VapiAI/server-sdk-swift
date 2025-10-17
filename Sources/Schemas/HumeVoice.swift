import Foundation

public struct HumeVoice: Codable, Hashable, Sendable {
    /// This is the flag to toggle voice caching for the assistant.
    public let cachingEnabled: Bool?
    /// This is the model that will be used.
    public let model: HumeVoiceModel?
    /// The ID of the particular voice you want to use.
    public let voiceId: String
    /// Indicates whether the chosen voice is a preset Hume AI voice or a custom voice.
    public let isCustomHumeVoice: Bool?
    /// This is the plan for chunking the model output before it is sent to the voice provider.
    public let chunkPlan: ChunkPlan?
    /// Natural language instructions describing how the synthesized speech should sound, including but not limited to tone, intonation, pacing, and accent (e.g., 'a soft, gentle voice with a strong British accent').
    /// 
    /// If a Voice is specified in the request, this description serves as acting instructions.
    /// If no Voice is specified, a new voice is generated based on this description.
    public let description: String?
    /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
    public let fallbackPlan: FallbackPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cachingEnabled: Bool? = nil,
        model: HumeVoiceModel? = nil,
        voiceId: String,
        isCustomHumeVoice: Bool? = nil,
        chunkPlan: ChunkPlan? = nil,
        description: String? = nil,
        fallbackPlan: FallbackPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cachingEnabled = cachingEnabled
        self.model = model
        self.voiceId = voiceId
        self.isCustomHumeVoice = isCustomHumeVoice
        self.chunkPlan = chunkPlan
        self.description = description
        self.fallbackPlan = fallbackPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
        self.model = try container.decodeIfPresent(HumeVoiceModel.self, forKey: .model)
        self.voiceId = try container.decode(String.self, forKey: .voiceId)
        self.isCustomHumeVoice = try container.decodeIfPresent(Bool.self, forKey: .isCustomHumeVoice)
        self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.fallbackPlan = try container.decodeIfPresent(FallbackPlan.self, forKey: .fallbackPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encode(self.voiceId, forKey: .voiceId)
        try container.encodeIfPresent(self.isCustomHumeVoice, forKey: .isCustomHumeVoice)
        try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cachingEnabled
        case model
        case voiceId
        case isCustomHumeVoice
        case chunkPlan
        case description
        case fallbackPlan
    }
}