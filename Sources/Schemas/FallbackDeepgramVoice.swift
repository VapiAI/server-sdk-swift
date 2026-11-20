import Foundation

/// Fallback configuration for synthesizing assistant speech with Deepgram, including voice and model selection, model-improvement preferences, chunking, and caching.
public struct FallbackDeepgramVoice: Codable, Hashable, Sendable {
    /// This is the flag to toggle voice caching for the assistant.
    public let cachingEnabled: Bool?
    /// This is the provider-specific ID that will be used.
    public let voiceId: FallbackDeepgramVoiceId
    /// This is the model that will be used. Defaults to 'aura' when not specified.
    public let model: FallbackDeepgramVoiceModel?
    /// If set to true, this will add mip_opt_out=true as a query parameter of all API requests. See https://developers.deepgram.com/docs/the-deepgram-model-improvement-partnership-program#want-to-opt-out
    /// 
    /// This only applies to your own Deepgram API key. Requests on Vapi's key always opt out, whatever this is set to.
    /// 
    /// @default false
    public let mipOptOut: Bool?
    /// This is the speed multiplier that will be used. Aura-2 accepts 0.7 to 1.5; Flux accepts 0.5 to 1.5 in steps of 0.05. Aura does not support speed.
    /// 
    /// @default 1
    public let speed: Double?
    /// This is the expressivity level for Flux voices, from -2 (flat) to 2 (lively). Deepgram marks this control as beta and may retune the scale. Aura and Aura-2 do not support it.
    /// 
    /// @default 0
    public let expressivity: Double?
    /// This is the plan for chunking the model output before it is sent to the voice provider.
    public let chunkPlan: ChunkPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cachingEnabled: Bool? = nil,
        voiceId: FallbackDeepgramVoiceId,
        model: FallbackDeepgramVoiceModel? = nil,
        mipOptOut: Bool? = nil,
        speed: Double? = nil,
        expressivity: Double? = nil,
        chunkPlan: ChunkPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cachingEnabled = cachingEnabled
        self.voiceId = voiceId
        self.model = model
        self.mipOptOut = mipOptOut
        self.speed = speed
        self.expressivity = expressivity
        self.chunkPlan = chunkPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
        self.voiceId = try container.decode(FallbackDeepgramVoiceId.self, forKey: .voiceId)
        self.model = try container.decodeIfPresent(FallbackDeepgramVoiceModel.self, forKey: .model)
        self.mipOptOut = try container.decodeIfPresent(Bool.self, forKey: .mipOptOut)
        self.speed = try container.decodeIfPresent(Double.self, forKey: .speed)
        self.expressivity = try container.decodeIfPresent(Double.self, forKey: .expressivity)
        self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
        try container.encode(self.voiceId, forKey: .voiceId)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encodeIfPresent(self.mipOptOut, forKey: .mipOptOut)
        try container.encodeIfPresent(self.speed, forKey: .speed)
        try container.encodeIfPresent(self.expressivity, forKey: .expressivity)
        try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cachingEnabled
        case voiceId
        case model
        case mipOptOut
        case speed
        case expressivity
        case chunkPlan
    }
}