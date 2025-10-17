import Foundation

extension Requests {
    public struct CreateStructuredOutputDto: Codable, Hashable, Sendable {
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
        public let model: CreateStructuredOutputDtoModel?
        /// This is the name of the structured output.
        public let name: String
        /// This is the JSON Schema definition for the structured output.
        /// 
        /// This is required when creating a structured output. Defines the structure and validation rules for the data that will be extracted. Supports all JSON Schema features including:
        /// - Objects and nested properties
        /// - Arrays and array validation
        /// - String, number, boolean, and null types
        /// - Enums and const values
        /// - Validation constraints (min/max, patterns, etc.)
        /// - Composition with allOf, anyOf, oneOf
        public let schema: JsonSchema
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
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            model: CreateStructuredOutputDtoModel? = nil,
            name: String,
            schema: JsonSchema,
            description: String? = nil,
            assistantIds: [String]? = nil,
            workflowIds: [String]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.model = model
            self.name = name
            self.schema = schema
            self.description = description
            self.assistantIds = assistantIds
            self.workflowIds = workflowIds
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.model = try container.decodeIfPresent(CreateStructuredOutputDtoModel.self, forKey: .model)
            self.name = try container.decode(String.self, forKey: .name)
            self.schema = try container.decode(JsonSchema.self, forKey: .schema)
            self.description = try container.decodeIfPresent(String.self, forKey: .description)
            self.assistantIds = try container.decodeIfPresent([String].self, forKey: .assistantIds)
            self.workflowIds = try container.decodeIfPresent([String].self, forKey: .workflowIds)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.model, forKey: .model)
            try container.encode(self.name, forKey: .name)
            try container.encode(self.schema, forKey: .schema)
            try container.encodeIfPresent(self.description, forKey: .description)
            try container.encodeIfPresent(self.assistantIds, forKey: .assistantIds)
            try container.encodeIfPresent(self.workflowIds, forKey: .workflowIds)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case model
            case name
            case schema
            case description
            case assistantIds
            case workflowIds
        }
    }
}