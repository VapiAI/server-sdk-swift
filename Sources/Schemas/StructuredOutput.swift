import Foundation

public struct StructuredOutput: Codable, Hashable, Sendable {
    /// This is the model that will be used to extract the structured output.
    /// 
    /// To provide your own custom system and user prompts for structured output extraction, populate the messages array with your system and user messages. You can specify liquid templating in your system and user messages.
    /// Between the system or user messages, you must reference either 'transcript' or 'messages' with the '{{}}' syntax to access the conversation history.
    /// Between the system or user messages, you must reference a variation of the structured output with the '{{}}' syntax to access the structured output definition.
    /// i.e.:
    /// {{structuredOutput}}
    /// {{structuredOutput.name}}
    /// {{structuredOutput.description}}
    /// {{structuredOutput.schema}}
    /// 
    /// If model is not specified, GPT-4.1 will be used by default for extraction, utilizing default system and user prompts.
    /// If messages or required fields are not specified, the default system and user prompts will be used.
    public let model: StructuredOutputModel?
    /// This is the unique identifier for the structured output.
    public let id: String
    /// This is the unique identifier for the org that this structured output belongs to.
    public let orgId: String
    /// This is the ISO 8601 date-time string of when the structured output was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the structured output was last updated.
    public let updatedAt: Date
    /// This is the name of the structured output.
    public let name: String
    /// This is the description of what the structured output extracts.
    /// 
    /// Use this to provide context about what data will be extracted and how it will be used.
    public let description: String?
    /// These are the assistant IDs that this structured output is linked to.
    /// 
    /// When linked to assistants, this structured output will be available for extraction during those assistant's calls.
    public let assistantIds: [String]?
    /// These are the workflow IDs that this structured output is linked to.
    /// 
    /// When linked to workflows, this structured output will be available for extraction during those workflow's execution.
    public let workflowIds: [String]?
    /// This is the JSON Schema definition for the structured output.
    /// 
    /// Defines the structure and validation rules for the data that will be extracted. Supports all JSON Schema features including:
    /// - Objects and nested properties
    /// - Arrays and array validation
    /// - String, number, boolean, and null types
    /// - Enums and const values
    /// - Validation constraints (min/max, patterns, etc.)
    /// - Composition with allOf, anyOf, oneOf
    public let schema: JsonSchema
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        model: StructuredOutputModel? = nil,
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        name: String,
        description: String? = nil,
        assistantIds: [String]? = nil,
        workflowIds: [String]? = nil,
        schema: JsonSchema,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.model = model
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.description = description
        self.assistantIds = assistantIds
        self.workflowIds = workflowIds
        self.schema = schema
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.model = try container.decodeIfPresent(StructuredOutputModel.self, forKey: .model)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.assistantIds = try container.decodeIfPresent([String].self, forKey: .assistantIds)
        self.workflowIds = try container.decodeIfPresent([String].self, forKey: .workflowIds)
        self.schema = try container.decode(JsonSchema.self, forKey: .schema)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.assistantIds, forKey: .assistantIds)
        try container.encodeIfPresent(self.workflowIds, forKey: .workflowIds)
        try container.encode(self.schema, forKey: .schema)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case model
        case id
        case orgId
        case createdAt
        case updatedAt
        case name
        case description
        case assistantIds
        case workflowIds
        case schema
    }
}