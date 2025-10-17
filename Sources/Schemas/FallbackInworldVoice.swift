import Foundation

public struct FallbackInworldVoice: Codable, Hashable, Sendable {
    /// This is the flag to toggle voice caching for the assistant.
    public let cachingEnabled: Bool?
    /// Available voices by language:
    /// • en: Alex, Ashley, Craig, Deborah, Dennis, Edward, Elizabeth, Hades, Julia, Pixie, Mark, Olivia, Priya, Ronald, Sarah, Shaun, Theodore, Timothy, Wendy, Dominus
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
    public let voiceId: FallbackInworldVoiceVoiceId
    /// This is the model that will be used.
    public let model: InworldTts1?
    /// Language code for Inworld TTS synthesis
    public let languageCode: FallbackInworldVoiceLanguageCode?
    /// This is the plan for chunking the model output before it is sent to the voice provider.
    public let chunkPlan: ChunkPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cachingEnabled: Bool? = nil,
        voiceId: FallbackInworldVoiceVoiceId,
        model: InworldTts1? = nil,
        languageCode: FallbackInworldVoiceLanguageCode? = nil,
        chunkPlan: ChunkPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cachingEnabled = cachingEnabled
        self.voiceId = voiceId
        self.model = model
        self.languageCode = languageCode
        self.chunkPlan = chunkPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
        self.voiceId = try container.decode(FallbackInworldVoiceVoiceId.self, forKey: .voiceId)
        self.model = try container.decodeIfPresent(InworldTts1.self, forKey: .model)
        self.languageCode = try container.decodeIfPresent(FallbackInworldVoiceLanguageCode.self, forKey: .languageCode)
        self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
        try container.encode(self.voiceId, forKey: .voiceId)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encodeIfPresent(self.languageCode, forKey: .languageCode)
        try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
    }

    public enum InworldTts1: String, Codable, Hashable, CaseIterable, Sendable {
        case inworldTts1 = "inworld-tts-1"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cachingEnabled
        case voiceId
        case model
        case languageCode
        case chunkPlan
    }
}