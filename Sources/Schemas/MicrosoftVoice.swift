import Foundation

public struct MicrosoftVoice: Codable, Hashable, Sendable {
    /// This is the flag to toggle voice caching for the assistant.
    public let cachingEnabled: Bool?
    /// MAI-Voice-2 voice ID. Built-in voices listed in enum.
    public let voiceId: MicrosoftVoiceVoiceId
    /// Speaking style applied via mstts:express-as on every request. Unknown styles are ignored by Azure and fall back to neutral.
    public let style: MicrosoftVoiceStyle?
    /// Style intensity (0.01–2). Default 1 = the predefined style strength. Only applies when `style` is set.
    public let styleDegree: Double?
    /// Role-play (age/gender imitation). Requires `style` to be set; ignored otherwise.
    public let role: MicrosoftVoiceRole?
    /// This is the plan for chunking the model output before it is sent to the voice provider.
    public let chunkPlan: ChunkPlan?
    /// This is the speed multiplier that will be used.
    public let speed: Double?
    /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
    public let fallbackPlan: FallbackPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cachingEnabled: Bool? = nil,
        voiceId: MicrosoftVoiceVoiceId,
        style: MicrosoftVoiceStyle? = nil,
        styleDegree: Double? = nil,
        role: MicrosoftVoiceRole? = nil,
        chunkPlan: ChunkPlan? = nil,
        speed: Double? = nil,
        fallbackPlan: FallbackPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cachingEnabled = cachingEnabled
        self.voiceId = voiceId
        self.style = style
        self.styleDegree = styleDegree
        self.role = role
        self.chunkPlan = chunkPlan
        self.speed = speed
        self.fallbackPlan = fallbackPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
        self.voiceId = try container.decode(MicrosoftVoiceVoiceId.self, forKey: .voiceId)
        self.style = try container.decodeIfPresent(MicrosoftVoiceStyle.self, forKey: .style)
        self.styleDegree = try container.decodeIfPresent(Double.self, forKey: .styleDegree)
        self.role = try container.decodeIfPresent(MicrosoftVoiceRole.self, forKey: .role)
        self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
        self.speed = try container.decodeIfPresent(Double.self, forKey: .speed)
        self.fallbackPlan = try container.decodeIfPresent(FallbackPlan.self, forKey: .fallbackPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
        try container.encode(self.voiceId, forKey: .voiceId)
        try container.encodeIfPresent(self.style, forKey: .style)
        try container.encodeIfPresent(self.styleDegree, forKey: .styleDegree)
        try container.encodeIfPresent(self.role, forKey: .role)
        try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
        try container.encodeIfPresent(self.speed, forKey: .speed)
        try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cachingEnabled
        case voiceId
        case style
        case styleDegree
        case role
        case chunkPlan
        case speed
        case fallbackPlan
    }
}