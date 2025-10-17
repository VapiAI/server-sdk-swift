import Foundation

public struct FallbackRimeAiVoice: Codable, Hashable, Sendable {
    /// This is the flag to toggle voice caching for the assistant.
    public let cachingEnabled: Bool?
    /// This is the provider-specific ID that will be used.
    public let voiceId: FallbackRimeAiVoiceId
    /// This is the model that will be used. Defaults to 'arcana' when not specified.
    public let model: FallbackRimeAiVoiceModel?
    /// This is the speed multiplier that will be used.
    public let speed: Double?
    /// This is a flag that controls whether to add slight pauses using angle brackets. Example: "Hi. <200> I'd love to have a conversation with you." adds a 200ms pause between the first and second sentences.
    public let pauseBetweenBrackets: Bool?
    /// This is a flag that controls whether text inside brackets should be phonemized (converted to phonetic pronunciation) - Example: "{h'El.o} World" will pronounce "Hello" as expected.
    public let phonemizeBetweenBrackets: Bool?
    /// This is a flag that controls whether to optimize for reduced latency in streaming. https://docs.rime.ai/api-reference/endpoint/websockets#param-reduce-latency
    public let reduceLatency: Bool?
    /// This is a string that allows inline speed control using alpha notation. https://docs.rime.ai/api-reference/endpoint/websockets#param-inline-speed-alpha
    public let inlineSpeedAlpha: String?
    /// This is the plan for chunking the model output before it is sent to the voice provider.
    public let chunkPlan: ChunkPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cachingEnabled: Bool? = nil,
        voiceId: FallbackRimeAiVoiceId,
        model: FallbackRimeAiVoiceModel? = nil,
        speed: Double? = nil,
        pauseBetweenBrackets: Bool? = nil,
        phonemizeBetweenBrackets: Bool? = nil,
        reduceLatency: Bool? = nil,
        inlineSpeedAlpha: String? = nil,
        chunkPlan: ChunkPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cachingEnabled = cachingEnabled
        self.voiceId = voiceId
        self.model = model
        self.speed = speed
        self.pauseBetweenBrackets = pauseBetweenBrackets
        self.phonemizeBetweenBrackets = phonemizeBetweenBrackets
        self.reduceLatency = reduceLatency
        self.inlineSpeedAlpha = inlineSpeedAlpha
        self.chunkPlan = chunkPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
        self.voiceId = try container.decode(FallbackRimeAiVoiceId.self, forKey: .voiceId)
        self.model = try container.decodeIfPresent(FallbackRimeAiVoiceModel.self, forKey: .model)
        self.speed = try container.decodeIfPresent(Double.self, forKey: .speed)
        self.pauseBetweenBrackets = try container.decodeIfPresent(Bool.self, forKey: .pauseBetweenBrackets)
        self.phonemizeBetweenBrackets = try container.decodeIfPresent(Bool.self, forKey: .phonemizeBetweenBrackets)
        self.reduceLatency = try container.decodeIfPresent(Bool.self, forKey: .reduceLatency)
        self.inlineSpeedAlpha = try container.decodeIfPresent(String.self, forKey: .inlineSpeedAlpha)
        self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
        try container.encode(self.voiceId, forKey: .voiceId)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encodeIfPresent(self.speed, forKey: .speed)
        try container.encodeIfPresent(self.pauseBetweenBrackets, forKey: .pauseBetweenBrackets)
        try container.encodeIfPresent(self.phonemizeBetweenBrackets, forKey: .phonemizeBetweenBrackets)
        try container.encodeIfPresent(self.reduceLatency, forKey: .reduceLatency)
        try container.encodeIfPresent(self.inlineSpeedAlpha, forKey: .inlineSpeedAlpha)
        try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cachingEnabled
        case voiceId
        case model
        case speed
        case pauseBetweenBrackets
        case phonemizeBetweenBrackets
        case reduceLatency
        case inlineSpeedAlpha
        case chunkPlan
    }
}