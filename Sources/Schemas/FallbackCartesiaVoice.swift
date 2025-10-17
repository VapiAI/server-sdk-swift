import Foundation

public struct FallbackCartesiaVoice: Codable, Hashable, Sendable {
    /// This is the flag to toggle voice caching for the assistant.
    public let cachingEnabled: Bool?
    /// The ID of the particular voice you want to use.
    public let voiceId: String
    /// This is the model that will be used. This is optional and will default to the correct model for the voiceId.
    public let model: FallbackCartesiaVoiceModel?
    /// This is the language that will be used. This is optional and will default to the correct language for the voiceId.
    public let language: FallbackCartesiaVoiceLanguage?
    /// Experimental controls for Cartesia voice generation
    public let experimentalControls: CartesiaExperimentalControls?
    /// This is the plan for chunking the model output before it is sent to the voice provider.
    public let chunkPlan: ChunkPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cachingEnabled: Bool? = nil,
        voiceId: String,
        model: FallbackCartesiaVoiceModel? = nil,
        language: FallbackCartesiaVoiceLanguage? = nil,
        experimentalControls: CartesiaExperimentalControls? = nil,
        chunkPlan: ChunkPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cachingEnabled = cachingEnabled
        self.voiceId = voiceId
        self.model = model
        self.language = language
        self.experimentalControls = experimentalControls
        self.chunkPlan = chunkPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
        self.voiceId = try container.decode(String.self, forKey: .voiceId)
        self.model = try container.decodeIfPresent(FallbackCartesiaVoiceModel.self, forKey: .model)
        self.language = try container.decodeIfPresent(FallbackCartesiaVoiceLanguage.self, forKey: .language)
        self.experimentalControls = try container.decodeIfPresent(CartesiaExperimentalControls.self, forKey: .experimentalControls)
        self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
        try container.encode(self.voiceId, forKey: .voiceId)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.experimentalControls, forKey: .experimentalControls)
        try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cachingEnabled
        case voiceId
        case model
        case language
        case experimentalControls
        case chunkPlan
    }
}