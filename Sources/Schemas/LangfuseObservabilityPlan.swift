import Foundation

public struct LangfuseObservabilityPlan: Codable, Hashable, Sendable {
    public let provider: LangfuseObservabilityPlanProvider
    /// The name of a Langfuse prompt to link generations to. This enables tracking which prompt version was used for each generation. https://langfuse.com/docs/prompt-management/features/link-to-traces
    public let promptName: String?
    /// The version number of the Langfuse prompt to link generations to. Used together with promptName to identify the exact prompt version. https://langfuse.com/docs/prompt-management/features/link-to-traces
    public let promptVersion: Double?
    /// Custom name for the Langfuse trace. Supports Liquid templates.
    /// 
    /// Available variables:
    /// - {{ call.id }} - Call UUID
    /// - {{ call.type }} - 'inboundPhoneCall', 'outboundPhoneCall', 'webCall'
    /// - {{ assistant.name }} - Assistant name
    /// - {{ assistant.id }} - Assistant ID
    /// 
    /// Example: "{{ assistant.name }} - {{ call.type }}"
    /// 
    /// Defaults to call ID if not provided.
    public let traceName: String?
    /// This is an array of tags to be added to the Langfuse trace. Tags allow you to categorize and filter traces. https://langfuse.com/docs/tracing-features/tags
    public let tags: [String]
    /// This is a JSON object that will be added to the Langfuse trace. Traces can be enriched with metadata to better understand your users, application, and experiments. https://langfuse.com/docs/tracing-features/metadata
    /// By default it includes the call metadata, assistant metadata, and assistant overrides.
    public let metadata: [String: JSONValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: LangfuseObservabilityPlanProvider,
        promptName: String? = nil,
        promptVersion: Double? = nil,
        traceName: String? = nil,
        tags: [String],
        metadata: [String: JSONValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.promptName = promptName
        self.promptVersion = promptVersion
        self.traceName = traceName
        self.tags = tags
        self.metadata = metadata
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decode(LangfuseObservabilityPlanProvider.self, forKey: .provider)
        self.promptName = try container.decodeIfPresent(String.self, forKey: .promptName)
        self.promptVersion = try container.decodeIfPresent(Double.self, forKey: .promptVersion)
        self.traceName = try container.decodeIfPresent(String.self, forKey: .traceName)
        self.tags = try container.decode([String].self, forKey: .tags)
        self.metadata = try container.decodeIfPresent([String: JSONValue].self, forKey: .metadata)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.promptName, forKey: .promptName)
        try container.encodeIfPresent(self.promptVersion, forKey: .promptVersion)
        try container.encodeIfPresent(self.traceName, forKey: .traceName)
        try container.encode(self.tags, forKey: .tags)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case promptName
        case promptVersion
        case traceName
        case tags
        case metadata
    }
}