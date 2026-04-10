import Foundation

public struct WellSaidVoice: Codable, Hashable, Sendable {
    /// This is the flag to toggle voice caching for the assistant.
    public let cachingEnabled: Bool?
    /// The WellSaid speaker ID to synthesize.
    public let voiceId: String
    /// This is the model that will be used.
    public let model: WellSaidVoiceModel?
    /// Enables limited SSML translation for input text.
    public let enableSsml: Bool?
    /// Array of library IDs to use for voice synthesis.
    public let libraryIds: [String]?
    /// This is the plan for chunking the model output before it is sent to the voice provider.
    public let chunkPlan: ChunkPlan?
    /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
    public let fallbackPlan: FallbackPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cachingEnabled: Bool? = nil,
        voiceId: String,
        model: WellSaidVoiceModel? = nil,
        enableSsml: Bool? = nil,
        libraryIds: [String]? = nil,
        chunkPlan: ChunkPlan? = nil,
        fallbackPlan: FallbackPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cachingEnabled = cachingEnabled
        self.voiceId = voiceId
        self.model = model
        self.enableSsml = enableSsml
        self.libraryIds = libraryIds
        self.chunkPlan = chunkPlan
        self.fallbackPlan = fallbackPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
        self.voiceId = try container.decode(String.self, forKey: .voiceId)
        self.model = try container.decodeIfPresent(WellSaidVoiceModel.self, forKey: .model)
        self.enableSsml = try container.decodeIfPresent(Bool.self, forKey: .enableSsml)
        self.libraryIds = try container.decodeIfPresent([String].self, forKey: .libraryIds)
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
        try container.encodeIfPresent(self.enableSsml, forKey: .enableSsml)
        try container.encodeIfPresent(self.libraryIds, forKey: .libraryIds)
        try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
        try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cachingEnabled
        case voiceId
        case model
        case enableSsml
        case libraryIds
        case chunkPlan
        case fallbackPlan
    }
}