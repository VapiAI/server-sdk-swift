import Foundation

public struct FallbackOpenAiVoice: Codable, Hashable, Sendable {
    /// This is the flag to toggle voice caching for the assistant.
    public let cachingEnabled: Bool?
    /// This is the provider-specific ID that will be used.
    /// Please note that ash, ballad, coral, sage, and verse may only be used with realtime models.
    public let voiceId: FallbackOpenAiVoiceId
    /// This is the model that will be used for text-to-speech.
    public let model: FallbackOpenAiVoiceModel?
    /// This is a prompt that allows you to control the voice of your generated audio.
    /// Does not work with 'tts-1' or 'tts-1-hd' models.
    public let instructions: String?
    /// This is the speed multiplier that will be used.
    public let speed: Double?
    /// This is the plan for chunking the model output before it is sent to the voice provider.
    public let chunkPlan: ChunkPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cachingEnabled: Bool? = nil,
        voiceId: FallbackOpenAiVoiceId,
        model: FallbackOpenAiVoiceModel? = nil,
        instructions: String? = nil,
        speed: Double? = nil,
        chunkPlan: ChunkPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cachingEnabled = cachingEnabled
        self.voiceId = voiceId
        self.model = model
        self.instructions = instructions
        self.speed = speed
        self.chunkPlan = chunkPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
        self.voiceId = try container.decode(FallbackOpenAiVoiceId.self, forKey: .voiceId)
        self.model = try container.decodeIfPresent(FallbackOpenAiVoiceModel.self, forKey: .model)
        self.instructions = try container.decodeIfPresent(String.self, forKey: .instructions)
        self.speed = try container.decodeIfPresent(Double.self, forKey: .speed)
        self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
        try container.encode(self.voiceId, forKey: .voiceId)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encodeIfPresent(self.instructions, forKey: .instructions)
        try container.encodeIfPresent(self.speed, forKey: .speed)
        try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cachingEnabled
        case voiceId
        case model
        case instructions
        case speed
        case chunkPlan
    }
}