import Foundation

public struct FallbackHumeVoice: Codable, Hashable, Sendable {
    /// This is the flag to toggle voice caching for the assistant.
    public let cachingEnabled: Bool?
    /// This is the model that will be used.
    public let model: FallbackHumeVoiceModel?
    /// The ID of the particular voice you want to use.
    public let voiceId: String
    /// Indicates whether the chosen voice is a preset Hume AI voice or a custom voice.
    public let isCustomHumeVoice: Bool?
    /// Natural language instructions describing how the synthesized speech should sound, including but not limited to tone, intonation, pacing, and accent (e.g., 'a soft, gentle voice with a strong British accent').
    /// 
    /// If a Voice is specified in the request, this description serves as acting instructions.
    /// If no Voice is specified, a new voice is generated based on this description.
    public let description: String?
    /// This is the plan for chunking the model output before it is sent to the voice provider.
    public let chunkPlan: ChunkPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cachingEnabled: Bool? = nil,
        model: FallbackHumeVoiceModel? = nil,
        voiceId: String,
        isCustomHumeVoice: Bool? = nil,
        description: String? = nil,
        chunkPlan: ChunkPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cachingEnabled = cachingEnabled
        self.model = model
        self.voiceId = voiceId
        self.isCustomHumeVoice = isCustomHumeVoice
        self.description = description
        self.chunkPlan = chunkPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
        self.model = try container.decodeIfPresent(FallbackHumeVoiceModel.self, forKey: .model)
        self.voiceId = try container.decode(String.self, forKey: .voiceId)
        self.isCustomHumeVoice = try container.decodeIfPresent(Bool.self, forKey: .isCustomHumeVoice)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encode(self.voiceId, forKey: .voiceId)
        try container.encodeIfPresent(self.isCustomHumeVoice, forKey: .isCustomHumeVoice)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cachingEnabled
        case model
        case voiceId
        case isCustomHumeVoice
        case description
        case chunkPlan
    }
}