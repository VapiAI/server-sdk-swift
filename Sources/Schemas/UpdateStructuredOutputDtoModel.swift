import Foundation

/// This is the model that will be used to extract the structured output.
/// 
/// To provide your own custom system and user prompts for structured output extraction, populate the messages array with your system and user messages. You can specify liquid templating in your system and user messages.
/// Between the system or user messages, you must reference either 'transcript' or 'messages' with the `{{}}` syntax to access the conversation history.
/// Between the system or user messages, you must reference a variation of the structured output with the `{{}}` syntax to access the structured output definition.
/// i.e.:
/// `{{structuredOutput}}`
/// `{{structuredOutput.name}}`
/// `{{structuredOutput.description}}`
/// `{{structuredOutput.schema}}`
/// 
/// If model is not specified, GPT-4.1 will be used by default for extraction, utilizing default system and user prompts.
/// If messages or required fields are not specified, the default system and user prompts will be used.
public enum UpdateStructuredOutputDtoModel: Codable, Hashable, Sendable {
    case anthropic(WorkflowAnthropicModel)
    case anthropicBedrock(WorkflowAnthropicBedrockModel)
    case customLlm(WorkflowCustomModel)
    case google(WorkflowGoogleModel)
    case openai(WorkflowOpenAiModel)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .provider)
        switch discriminant {
        case "anthropic":
            self = .anthropic(try WorkflowAnthropicModel(from: decoder))
        case "anthropic-bedrock":
            self = .anthropicBedrock(try WorkflowAnthropicBedrockModel(from: decoder))
        case "custom-llm":
            self = .customLlm(try WorkflowCustomModel(from: decoder))
        case "google":
            self = .google(try WorkflowGoogleModel(from: decoder))
        case "openai":
            self = .openai(try WorkflowOpenAiModel(from: decoder))
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unknown shape discriminant value: \(discriminant)"
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .anthropic(let data):
            try container.encode("anthropic", forKey: .provider)
            try data.encode(to: encoder)
        case .anthropicBedrock(let data):
            try container.encode("anthropic-bedrock", forKey: .provider)
            try data.encode(to: encoder)
        case .customLlm(let data):
            try container.encode("custom-llm", forKey: .provider)
            try data.encode(to: encoder)
        case .google(let data):
            try container.encode("google", forKey: .provider)
            try data.encode(to: encoder)
        case .openai(let data):
            try container.encode("openai", forKey: .provider)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
    }
}