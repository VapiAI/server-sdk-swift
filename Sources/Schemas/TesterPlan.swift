import Foundation

public struct TesterPlan: Codable, Hashable, Sendable {
    /// Pass a transient assistant to use for the test assistant.
    /// 
    /// Make sure to write a detailed system prompt for a test assistant, and use the {{test.script}} variable to access the test script.
    public let assistant: CreateAssistantDto?
    /// Pass an assistant id that can be access
    /// 
    /// Make sure to write a detailed system prompt for the test assistant, and use the {{test.script}} variable to access the test script.
    public let assistantId: String?
    /// Add any assistant overrides to the test assistant.
    /// 
    /// One use case is if you want to pass custom variables into the test using variableValues, that you can then access in the script
    /// and rubric using {{varName}}.
    public let assistantOverrides: AssistantOverrides?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        assistant: CreateAssistantDto? = nil,
        assistantId: String? = nil,
        assistantOverrides: AssistantOverrides? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.assistant = assistant
        self.assistantId = assistantId
        self.assistantOverrides = assistantOverrides
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assistant = try container.decodeIfPresent(CreateAssistantDto.self, forKey: .assistant)
        self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
        self.assistantOverrides = try container.decodeIfPresent(AssistantOverrides.self, forKey: .assistantOverrides)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.assistant, forKey: .assistant)
        try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
        try container.encodeIfPresent(self.assistantOverrides, forKey: .assistantOverrides)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case assistant
        case assistantId
        case assistantOverrides
    }
}