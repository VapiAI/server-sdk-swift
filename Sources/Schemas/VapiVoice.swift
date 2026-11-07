import Foundation

/// Configuration for synthesizing assistant speech with Vapi, including voice selection, speed, pronunciation dictionary, chunking, caching, and fallback settings.
public struct VapiVoice: Codable, Hashable, Sendable {
    /// This is the flag to toggle voice caching for the assistant.
    public let cachingEnabled: Bool?
    /// The voice to use: a built-in Vapi voice name, or a cloned voice id (used with version 2).
    public let voiceId: String
    /// The Vapi voice routing generation. `latest` auto-updates to the newest generation; version 1 uses legacy mappings; version 2 can use xAI-backed voices when available. When omitted, Version 1 is used. Accepts the string channel ('latest', '1', '2'); legacy numeric values (1, 2) are also accepted and coerced to their string form.
    public let version: VapiVoiceVersion?
    /// This is the speed multiplier that will be used.
    /// 
    /// @default 1
    public let speed: Double?
    /// Language for Vapi voice synthesis. For Version 2, omit this field or set `auto` for automatic language detection. Version 1 supports legacy Vapi language values.
    public let language: VapiVoiceLanguage?
    /// List of pronunciation dictionary locators for custom word pronunciations.
    public let pronunciationDictionary: [VapiPronunciationDictionaryLocator]?
    /// This is the plan for chunking the model output before it is sent to the voice provider.
    public let chunkPlan: ChunkPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cachingEnabled: Bool? = nil,
        voiceId: String,
        version: VapiVoiceVersion? = nil,
        speed: Double? = nil,
        language: VapiVoiceLanguage? = nil,
        pronunciationDictionary: [VapiPronunciationDictionaryLocator]? = nil,
        chunkPlan: ChunkPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cachingEnabled = cachingEnabled
        self.voiceId = voiceId
        self.version = version
        self.speed = speed
        self.language = language
        self.pronunciationDictionary = pronunciationDictionary
        self.chunkPlan = chunkPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
        self.voiceId = try container.decode(String.self, forKey: .voiceId)
        self.version = try container.decodeIfPresent(VapiVoiceVersion.self, forKey: .version)
        self.speed = try container.decodeIfPresent(Double.self, forKey: .speed)
        self.language = try container.decodeIfPresent(VapiVoiceLanguage.self, forKey: .language)
        self.pronunciationDictionary = try container.decodeIfPresent([VapiPronunciationDictionaryLocator].self, forKey: .pronunciationDictionary)
        self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
        try container.encode(self.voiceId, forKey: .voiceId)
        try container.encodeIfPresent(self.version, forKey: .version)
        try container.encodeIfPresent(self.speed, forKey: .speed)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.pronunciationDictionary, forKey: .pronunciationDictionary)
        try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cachingEnabled
        case voiceId
        case version
        case speed
        case language
        case pronunciationDictionary
        case chunkPlan
    }
}