import Foundation

public struct EvalRunTargetAssistant: Codable, Hashable, Sendable {
    /// This is the transient assistant that will be run against the eval
    public let assistant: CreateAssistantDto?
    /// This is the overrides that will be applied to the assistant.
    public let assistantOverrides: AssistantOverrides?
    /// This is the id of the assistant that will be run against the eval
    public let assistantId: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        assistant: CreateAssistantDto? = nil,
        assistantOverrides: AssistantOverrides? = nil,
        assistantId: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.assistant = assistant
        self.assistantOverrides = assistantOverrides
        self.assistantId = assistantId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assistant = try container.decodeIfPresent(CreateAssistantDto.self, forKey: .assistant)
        self.assistantOverrides = try container.decodeIfPresent(AssistantOverrides.self, forKey: .assistantOverrides)
        self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.assistant, forKey: .assistant)
        try container.encodeIfPresent(self.assistantOverrides, forKey: .assistantOverrides)
        try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case assistant
        case assistantOverrides
        case assistantId
    }
}