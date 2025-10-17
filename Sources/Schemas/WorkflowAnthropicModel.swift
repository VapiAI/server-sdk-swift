import Foundation

public struct WorkflowAnthropicModel: Codable, Hashable, Sendable {
    /// This is the specific model that will be used.
    public let model: WorkflowAnthropicModelModel
    /// This is the optional configuration for Anthropic's thinking feature.
    /// 
    /// - Only applicable for `claude-3-7-sonnet-20250219` model.
    /// - If provided, `maxTokens` must be greater than `thinking.budgetTokens`.
    public let thinking: AnthropicThinkingConfig?
    /// This is the temperature of the model.
    public let temperature: Double?
    /// This is the max tokens of the model.
    public let maxTokens: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        model: WorkflowAnthropicModelModel,
        thinking: AnthropicThinkingConfig? = nil,
        temperature: Double? = nil,
        maxTokens: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.model = model
        self.thinking = thinking
        self.temperature = temperature
        self.maxTokens = maxTokens
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.model = try container.decode(WorkflowAnthropicModelModel.self, forKey: .model)
        self.thinking = try container.decodeIfPresent(AnthropicThinkingConfig.self, forKey: .thinking)
        self.temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
        self.maxTokens = try container.decodeIfPresent(Double.self, forKey: .maxTokens)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.model, forKey: .model)
        try container.encodeIfPresent(self.thinking, forKey: .thinking)
        try container.encodeIfPresent(self.temperature, forKey: .temperature)
        try container.encodeIfPresent(self.maxTokens, forKey: .maxTokens)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case model
        case thinking
        case temperature
        case maxTokens
    }
}