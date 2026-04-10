import Foundation

public struct InworldVoice: Codable, Hashable, Sendable {
    /// This is the flag to toggle voice caching for the assistant.
    public let cachingEnabled: Bool?
    /// Available voices by language:
    /// • en: Alex, Ashley, Craig, Deborah, Dennis, Edward, Elizabeth, Hades, Julia, Pixie, Mark, Olivia, Priya, Ronald, Sarah, Shaun, Theodore, Timothy, Wendy, Dominus, Hana, Clive, Carter, Blake, Luna
    /// • zh: Yichen, Xiaoyin, Xinyi, Jing
    /// • nl: Erik, Katrien, Lennart, Lore
    /// • fr: Alain, Hélène, Mathieu, Étienne
    /// • de: Johanna, Josef
    /// • it: Gianni, Orietta
    /// • ja: Asuka, Satoshi
    /// • ko: Hyunwoo, Minji, Seojun, Yoona
    /// • pl: Szymon, Wojciech
    /// • pt: Heitor, Maitê
    /// • es: Diego, Lupita, Miguel, Rafael
    /// • ru: Svetlana, Elena, Dmitry, Nikolai
    /// • hi: Riya, Manoj
    /// • he: Yael, Oren
    /// • ar: Nour, Omar
    public let voiceId: InworldVoiceVoiceId
    /// This is the model that will be used.
    public let model: InworldVoiceModel?
    /// Language code for Inworld TTS synthesis
    public let languageCode: InworldVoiceLanguageCode?
    /// A floating point number between 0, exclusive, and 2, inclusive. If equal to null or not provided, the model's default temperature of 1.1 will be used. The temperature parameter controls variance.
    /// Higher values will make the output more random and can lead to more expressive results. Lower values will make it more deterministic.
    /// See https://docs.inworld.ai/docs/tts/capabilities/generating-audio#additional-configurations for more details.
    public let temperature: Double?
    /// A floating point number between 0.5, inclusive, and 1.5, inclusive. If equal to null or not provided, the model's default speaking speed of 1.0 will be used.
    /// Values above 0.8 are recommended for higher quality.
    /// See https://docs.inworld.ai/docs/tts/capabilities/generating-audio#additional-configurations for more details.
    public let speakingRate: Double?
    /// This is the plan for chunking the model output before it is sent to the voice provider.
    public let chunkPlan: ChunkPlan?
    /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
    public let fallbackPlan: FallbackPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cachingEnabled: Bool? = nil,
        voiceId: InworldVoiceVoiceId,
        model: InworldVoiceModel? = nil,
        languageCode: InworldVoiceLanguageCode? = nil,
        temperature: Double? = nil,
        speakingRate: Double? = nil,
        chunkPlan: ChunkPlan? = nil,
        fallbackPlan: FallbackPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cachingEnabled = cachingEnabled
        self.voiceId = voiceId
        self.model = model
        self.languageCode = languageCode
        self.temperature = temperature
        self.speakingRate = speakingRate
        self.chunkPlan = chunkPlan
        self.fallbackPlan = fallbackPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
        self.voiceId = try container.decode(InworldVoiceVoiceId.self, forKey: .voiceId)
        self.model = try container.decodeIfPresent(InworldVoiceModel.self, forKey: .model)
        self.languageCode = try container.decodeIfPresent(InworldVoiceLanguageCode.self, forKey: .languageCode)
        self.temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
        self.speakingRate = try container.decodeIfPresent(Double.self, forKey: .speakingRate)
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
        try container.encodeIfPresent(self.languageCode, forKey: .languageCode)
        try container.encodeIfPresent(self.temperature, forKey: .temperature)
        try container.encodeIfPresent(self.speakingRate, forKey: .speakingRate)
        try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
        try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cachingEnabled
        case voiceId
        case model
        case languageCode
        case temperature
        case speakingRate
        case chunkPlan
        case fallbackPlan
    }
}