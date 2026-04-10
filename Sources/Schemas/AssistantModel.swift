import Foundation

/// These are the options for the assistant's LLM.
public enum AssistantModel: Codable, Hashable, Sendable {
    case anthropic(AnthropicModel)
    case anthropicBedrock(AnthropicBedrockModel)
    case anyscale(AnyscaleModel)
    case cerebras(CerebrasModel)
    case customLlm(CustomLlmModel)
    case deepinfra(DeepInfraModel)
    case deepSeek(DeepSeekModel)
    case google(GoogleModel)
    case groq(GroqModel)
    case inflectionAi(InflectionAiModel)
    case minimax(MinimaxLlmModel)
    case openai(OpenAiModel)
    case openrouter(OpenRouterModel)
    case perplexityAi(PerplexityAiModel)
    case togetherAi(TogetherAiModel)
    case xai(XaiModel)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .provider)
        switch discriminant {
        case "anthropic":
            self = .anthropic(try AnthropicModel(from: decoder))
        case "anthropic-bedrock":
            self = .anthropicBedrock(try AnthropicBedrockModel(from: decoder))
        case "anyscale":
            self = .anyscale(try AnyscaleModel(from: decoder))
        case "cerebras":
            self = .cerebras(try CerebrasModel(from: decoder))
        case "custom-llm":
            self = .customLlm(try CustomLlmModel(from: decoder))
        case "deepinfra":
            self = .deepinfra(try DeepInfraModel(from: decoder))
        case "deep-seek":
            self = .deepSeek(try DeepSeekModel(from: decoder))
        case "google":
            self = .google(try GoogleModel(from: decoder))
        case "groq":
            self = .groq(try GroqModel(from: decoder))
        case "inflection-ai":
            self = .inflectionAi(try InflectionAiModel(from: decoder))
        case "minimax":
            self = .minimax(try MinimaxLlmModel(from: decoder))
        case "openai":
            self = .openai(try OpenAiModel(from: decoder))
        case "openrouter":
            self = .openrouter(try OpenRouterModel(from: decoder))
        case "perplexity-ai":
            self = .perplexityAi(try PerplexityAiModel(from: decoder))
        case "together-ai":
            self = .togetherAi(try TogetherAiModel(from: decoder))
        case "xai":
            self = .xai(try XaiModel(from: decoder))
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
        case .anyscale(let data):
            try container.encode("anyscale", forKey: .provider)
            try data.encode(to: encoder)
        case .cerebras(let data):
            try container.encode("cerebras", forKey: .provider)
            try data.encode(to: encoder)
        case .customLlm(let data):
            try container.encode("custom-llm", forKey: .provider)
            try data.encode(to: encoder)
        case .deepinfra(let data):
            try container.encode("deepinfra", forKey: .provider)
            try data.encode(to: encoder)
        case .deepSeek(let data):
            try container.encode("deep-seek", forKey: .provider)
            try data.encode(to: encoder)
        case .google(let data):
            try container.encode("google", forKey: .provider)
            try data.encode(to: encoder)
        case .groq(let data):
            try container.encode("groq", forKey: .provider)
            try data.encode(to: encoder)
        case .inflectionAi(let data):
            try container.encode("inflection-ai", forKey: .provider)
            try data.encode(to: encoder)
        case .minimax(let data):
            try container.encode("minimax", forKey: .provider)
            try data.encode(to: encoder)
        case .openai(let data):
            try container.encode("openai", forKey: .provider)
            try data.encode(to: encoder)
        case .openrouter(let data):
            try container.encode("openrouter", forKey: .provider)
            try data.encode(to: encoder)
        case .perplexityAi(let data):
            try container.encode("perplexity-ai", forKey: .provider)
            try data.encode(to: encoder)
        case .togetherAi(let data):
            try container.encode("together-ai", forKey: .provider)
            try data.encode(to: encoder)
        case .xai(let data):
            try container.encode("xai", forKey: .provider)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
    }
}