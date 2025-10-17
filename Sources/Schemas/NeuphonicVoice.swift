import Foundation

public struct NeuphonicVoice: Codable, Hashable, Sendable {
    /// This is the flag to toggle voice caching for the assistant.
    public let cachingEnabled: Bool?
    /// This is the provider-specific ID that will be used.
    public let voiceId: String
    /// This is the model that will be used. Defaults to 'neu_fast' if not specified.
    public let model: NeuphonicVoiceModel?
    /// This is the language (ISO 639-1) that is enforced for the model.
    public let language: [String: JSONValue]
    /// This is the speed multiplier that will be used.
    public let speed: Double?
    /// This is the plan for chunking the model output before it is sent to the voice provider.
    public let chunkPlan: ChunkPlan?
    /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
    public let fallbackPlan: FallbackPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cachingEnabled: Bool? = nil,
        voiceId: String,
        model: NeuphonicVoiceModel? = nil,
        language: [String: JSONValue],
        speed: Double? = nil,
        chunkPlan: ChunkPlan? = nil,
        fallbackPlan: FallbackPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cachingEnabled = cachingEnabled
        self.voiceId = voiceId
        self.model = model
        self.language = language
        self.speed = speed
        self.chunkPlan = chunkPlan
        self.fallbackPlan = fallbackPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
        self.voiceId = try container.decode(String.self, forKey: .voiceId)
        self.model = try container.decodeIfPresent(NeuphonicVoiceModel.self, forKey: .model)
        self.language = try container.decode([String: JSONValue].self, forKey: .language)
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
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encode(self.language, forKey: .language)
        try container.encodeIfPresent(self.speed, forKey: .speed)
        try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
        try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cachingEnabled
        case voiceId
        case model
        case language
        case speed
        case chunkPlan
        case fallbackPlan
    }
}