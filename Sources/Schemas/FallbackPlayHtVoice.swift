import Foundation

public struct FallbackPlayHtVoice: Codable, Hashable, Sendable {
    /// This is the flag to toggle voice caching for the assistant.
    public let cachingEnabled: Bool?
    /// This is the provider-specific ID that will be used.
    public let voiceId: FallbackPlayHtVoiceId
    /// This is the speed multiplier that will be used.
    public let speed: Double?
    /// A floating point number between 0, exclusive, and 2, inclusive. If equal to null or not provided, the model's default temperature will be used. The temperature parameter controls variance. Lower temperatures result in more predictable results, higher temperatures allow each run to vary more, so the voice may sound less like the baseline voice.
    public let temperature: Double?
    /// An emotion to be applied to the speech.
    public let emotion: FallbackPlayHtVoiceEmotion?
    /// A number between 1 and 6. Use lower numbers to reduce how unique your chosen voice will be compared to other voices.
    public let voiceGuidance: Double?
    /// A number between 1 and 30. Use lower numbers to to reduce how strong your chosen emotion will be. Higher numbers will create a very emotional performance.
    public let styleGuidance: Double?
    /// A number between 1 and 2. This number influences how closely the generated speech adheres to the input text. Use lower values to create more fluid speech, but with a higher chance of deviating from the input text. Higher numbers will make the generated speech more accurate to the input text, ensuring that the words spoken align closely with the provided text.
    public let textGuidance: Double?
    /// Playht voice model/engine to use.
    public let model: FallbackPlayHtVoiceModel?
    /// The language to use for the speech.
    public let language: FallbackPlayHtVoiceLanguage?
    /// This is the plan for chunking the model output before it is sent to the voice provider.
    public let chunkPlan: ChunkPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cachingEnabled: Bool? = nil,
        voiceId: FallbackPlayHtVoiceId,
        speed: Double? = nil,
        temperature: Double? = nil,
        emotion: FallbackPlayHtVoiceEmotion? = nil,
        voiceGuidance: Double? = nil,
        styleGuidance: Double? = nil,
        textGuidance: Double? = nil,
        model: FallbackPlayHtVoiceModel? = nil,
        language: FallbackPlayHtVoiceLanguage? = nil,
        chunkPlan: ChunkPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cachingEnabled = cachingEnabled
        self.voiceId = voiceId
        self.speed = speed
        self.temperature = temperature
        self.emotion = emotion
        self.voiceGuidance = voiceGuidance
        self.styleGuidance = styleGuidance
        self.textGuidance = textGuidance
        self.model = model
        self.language = language
        self.chunkPlan = chunkPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
        self.voiceId = try container.decode(FallbackPlayHtVoiceId.self, forKey: .voiceId)
        self.speed = try container.decodeIfPresent(Double.self, forKey: .speed)
        self.temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
        self.emotion = try container.decodeIfPresent(FallbackPlayHtVoiceEmotion.self, forKey: .emotion)
        self.voiceGuidance = try container.decodeIfPresent(Double.self, forKey: .voiceGuidance)
        self.styleGuidance = try container.decodeIfPresent(Double.self, forKey: .styleGuidance)
        self.textGuidance = try container.decodeIfPresent(Double.self, forKey: .textGuidance)
        self.model = try container.decodeIfPresent(FallbackPlayHtVoiceModel.self, forKey: .model)
        self.language = try container.decodeIfPresent(FallbackPlayHtVoiceLanguage.self, forKey: .language)
        self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
        try container.encode(self.voiceId, forKey: .voiceId)
        try container.encodeIfPresent(self.speed, forKey: .speed)
        try container.encodeIfPresent(self.temperature, forKey: .temperature)
        try container.encodeIfPresent(self.emotion, forKey: .emotion)
        try container.encodeIfPresent(self.voiceGuidance, forKey: .voiceGuidance)
        try container.encodeIfPresent(self.styleGuidance, forKey: .styleGuidance)
        try container.encodeIfPresent(self.textGuidance, forKey: .textGuidance)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cachingEnabled
        case voiceId
        case speed
        case temperature
        case emotion
        case voiceGuidance
        case styleGuidance
        case textGuidance
        case model
        case language
        case chunkPlan
    }
}