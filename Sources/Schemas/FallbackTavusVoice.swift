import Foundation

public struct FallbackTavusVoice: Codable, Hashable, Sendable {
    /// This is the flag to toggle voice caching for the assistant.
    public let cachingEnabled: Bool?
    /// This is the provider-specific ID that will be used.
    public let voiceId: FallbackTavusVoiceVoiceId
    /// This is the unique identifier for the persona that the replica will use in the conversation.
    public let personaId: String?
    /// This is the url that will receive webhooks with updates regarding the conversation state.
    public let callbackUrl: String?
    /// This is the name for the conversation.
    public let conversationName: String?
    /// This is the context that will be appended to any context provided in the persona, if one is provided.
    public let conversationalContext: String?
    /// This is the custom greeting that the replica will give once a participant joines the conversation.
    public let customGreeting: String?
    /// These are optional properties used to customize the conversation.
    public let properties: TavusConversationProperties?
    /// This is the plan for chunking the model output before it is sent to the voice provider.
    public let chunkPlan: ChunkPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cachingEnabled: Bool? = nil,
        voiceId: FallbackTavusVoiceVoiceId,
        personaId: String? = nil,
        callbackUrl: String? = nil,
        conversationName: String? = nil,
        conversationalContext: String? = nil,
        customGreeting: String? = nil,
        properties: TavusConversationProperties? = nil,
        chunkPlan: ChunkPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cachingEnabled = cachingEnabled
        self.voiceId = voiceId
        self.personaId = personaId
        self.callbackUrl = callbackUrl
        self.conversationName = conversationName
        self.conversationalContext = conversationalContext
        self.customGreeting = customGreeting
        self.properties = properties
        self.chunkPlan = chunkPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
        self.voiceId = try container.decode(FallbackTavusVoiceVoiceId.self, forKey: .voiceId)
        self.personaId = try container.decodeIfPresent(String.self, forKey: .personaId)
        self.callbackUrl = try container.decodeIfPresent(String.self, forKey: .callbackUrl)
        self.conversationName = try container.decodeIfPresent(String.self, forKey: .conversationName)
        self.conversationalContext = try container.decodeIfPresent(String.self, forKey: .conversationalContext)
        self.customGreeting = try container.decodeIfPresent(String.self, forKey: .customGreeting)
        self.properties = try container.decodeIfPresent(TavusConversationProperties.self, forKey: .properties)
        self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
        try container.encode(self.voiceId, forKey: .voiceId)
        try container.encodeIfPresent(self.personaId, forKey: .personaId)
        try container.encodeIfPresent(self.callbackUrl, forKey: .callbackUrl)
        try container.encodeIfPresent(self.conversationName, forKey: .conversationName)
        try container.encodeIfPresent(self.conversationalContext, forKey: .conversationalContext)
        try container.encodeIfPresent(self.customGreeting, forKey: .customGreeting)
        try container.encodeIfPresent(self.properties, forKey: .properties)
        try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cachingEnabled
        case voiceId
        case personaId
        case callbackUrl
        case conversationName
        case conversationalContext
        case customGreeting
        case properties
        case chunkPlan
    }
}