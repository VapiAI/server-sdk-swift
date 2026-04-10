import Foundation

public struct SimulationRunTargetAssistant: Codable, Hashable, Sendable {
    /// ID of an existing assistant to test against. Cannot be combined with inline assistant.
    public let assistantId: String?
    /// Inline assistant configuration to test against. Cannot be combined with assistantId.
    public let assistant: CreateAssistantDto?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        assistantId: String? = nil,
        assistant: CreateAssistantDto? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.assistantId = assistantId
        self.assistant = assistant
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
        self.assistant = try container.decodeIfPresent(CreateAssistantDto.self, forKey: .assistant)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
        try container.encodeIfPresent(self.assistant, forKey: .assistant)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case assistantId
        case assistant
    }
}