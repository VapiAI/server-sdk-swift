import Foundation

/// Workflow model configuration for OpenAI, including model selection, temperature, and maximum output tokens.
public struct WorkflowOpenAiModel: Codable, Hashable, Sendable {
    /// These are the messages used to customize the prompt used for structured output extraction.
    /// 
    /// When provided, these messages replace the default prompts. Message contents support LiquidJS templating with the following variables:
    /// - `{{transcript}}` or `{{messages}}` to reference the conversation (one is required)
    /// - `{{structuredOutput.name}}`, `{{structuredOutput.description}}`, or `{{structuredOutput.schema}}` to reference the structured output definition (one is required)
    /// - `{{systemPrompt}}`, `{{callEndedReason}}`, `{{duration}}`, `{{startedAt}}`, `{{endedAt}}`, and any `assistantOverrides.variableValues`
    /// 
    /// `{{messages}}` is the full message history including tool calls; `{{transcript}}` is the spoken text only, which uses significantly fewer tokens.
    /// 
    /// If not provided, default system and user prompts are used.
    public let messages: [OpenAiMessage]?
    /// This is the OpenAI model that will be used.
    /// 
    /// When using Vapi OpenAI or your own Azure Credentials, you have the option to specify the region for the selected model. This shouldn't be specified unless you have a specific reason to do so. Vapi will automatically find the fastest region that make sense.
    /// This is helpful when you are required to comply with Data Residency rules. Learn more about Azure regions here https://azure.microsoft.com/en-us/explore/global-infrastructure/data-residency/.
    public let model: WorkflowOpenAiModelModel
    /// This is the temperature of the model.
    public let temperature: Double?
    /// This is the max tokens of the model.
    public let maxTokens: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        messages: [OpenAiMessage]? = nil,
        model: WorkflowOpenAiModelModel,
        temperature: Double? = nil,
        maxTokens: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.messages = messages
        self.model = model
        self.temperature = temperature
        self.maxTokens = maxTokens
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.messages = try container.decodeIfPresent([OpenAiMessage].self, forKey: .messages)
        self.model = try container.decode(WorkflowOpenAiModelModel.self, forKey: .model)
        self.temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
        self.maxTokens = try container.decodeIfPresent(Double.self, forKey: .maxTokens)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.messages, forKey: .messages)
        try container.encode(self.model, forKey: .model)
        try container.encodeIfPresent(self.temperature, forKey: .temperature)
        try container.encodeIfPresent(self.maxTokens, forKey: .maxTokens)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case messages
        case model
        case temperature
        case maxTokens
    }
}