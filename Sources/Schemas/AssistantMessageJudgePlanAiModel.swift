import Foundation

/// This is the model to use for the LLM-as-a-judge.
/// If not provided, will default to the assistant's model.
/// 
/// The instructions on how to evaluate the model output with this LLM-Judge must be passed as a system message in the messages array of the model.
/// 
/// The Mock conversation can be passed to the LLM-Judge to evaluate using the prompt {{messages}} and will be evaluated as a LiquidJS Variable. To access and judge only the last message, use {{messages[-1]}}
/// 
/// The LLM-Judge must respond with "pass" or "fail" and only those two responses are allowed.
public enum AssistantMessageJudgePlanAiModel: Codable, Hashable, Sendable {
    case openai(Openai)
    case anthropic(Anthropic)
    case google(Google)
    case customLlm(CustomLlm)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .provider)
        switch discriminant {
        case "openai":
            self = .openai(try Openai(from: decoder))
        case "anthropic":
            self = .anthropic(try Anthropic(from: decoder))
        case "google":
            self = .google(try Google(from: decoder))
        case "custom-llm":
            self = .customLlm(try CustomLlm(from: decoder))
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
        switch self {
        case .openai(let data):
            try data.encode(to: encoder)
        case .anthropic(let data):
            try data.encode(to: encoder)
        case .google(let data):
            try data.encode(to: encoder)
        case .customLlm(let data):
            try data.encode(to: encoder)
        }
    }

    public struct Openai: Codable, Hashable, Sendable {
        public let provider: String = "openai"
        /// This is the OpenAI model that will be used.
        /// 
        /// When using Vapi OpenAI or your own Azure Credentials, you have the option to specify the region for the selected model. This shouldn't be specified unless you have a specific reason to do so. Vapi will automatically find the fastest region that make sense.
        /// This is helpful when you are required to comply with Data Residency rules. Learn more about Azure regions here https://azure.microsoft.com/en-us/explore/global-infrastructure/data-residency/.
        public let model: EvalOpenAiModelModel
        /// This is the temperature of the model. For LLM-as-a-judge, it's recommended to set it between 0 - 0.3 to avoid hallucinations and ensure the model judges the output correctly based on the instructions.
        public let temperature: Double?
        /// This is the max tokens of the model.
        /// If your Judge instructions return `true` or `false` takes only 1 token (as per the OpenAI Tokenizer), and therefore is recommended to set it to a low number to force the model to return a short response.
        public let maxTokens: Double?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            model: EvalOpenAiModelModel,
            temperature: Double? = nil,
            maxTokens: Double? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.model = model
            self.temperature = temperature
            self.maxTokens = maxTokens
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.model = try container.decode(EvalOpenAiModelModel.self, forKey: .model)
            self.temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
            self.maxTokens = try container.decodeIfPresent(Double.self, forKey: .maxTokens)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.model, forKey: .model)
            try container.encodeIfPresent(self.temperature, forKey: .temperature)
            try container.encodeIfPresent(self.maxTokens, forKey: .maxTokens)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case model
            case temperature
            case maxTokens
        }
    }

    public struct Anthropic: Codable, Hashable, Sendable {
        public let provider: String = "anthropic"
        /// This is the specific model that will be used.
        public let model: EvalAnthropicModelModel
        /// This is the optional configuration for Anthropic's thinking feature.
        /// 
        /// - Only applicable for `claude-3-7-sonnet-20250219` model.
        /// - If provided, `maxTokens` must be greater than `thinking.budgetTokens`.
        public let thinking: AnthropicThinkingConfig?
        /// This is the temperature of the model. For LLM-as-a-judge, it's recommended to set it between 0 - 0.3 to avoid hallucinations and ensure the model judges the output correctly based on the instructions.
        public let temperature: Double?
        /// This is the max tokens of the model.
        /// If your Judge instructions return `true` or `false` takes only 1 token (as per the OpenAI Tokenizer), and therefore is recommended to set it to a low number to force the model to return a short response.
        public let maxTokens: Double?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            model: EvalAnthropicModelModel,
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
            self.model = try container.decode(EvalAnthropicModelModel.self, forKey: .model)
            self.thinking = try container.decodeIfPresent(AnthropicThinkingConfig.self, forKey: .thinking)
            self.temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
            self.maxTokens = try container.decodeIfPresent(Double.self, forKey: .maxTokens)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.model, forKey: .model)
            try container.encodeIfPresent(self.thinking, forKey: .thinking)
            try container.encodeIfPresent(self.temperature, forKey: .temperature)
            try container.encodeIfPresent(self.maxTokens, forKey: .maxTokens)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case model
            case thinking
            case temperature
            case maxTokens
        }
    }

    public struct Google: Codable, Hashable, Sendable {
        public let provider: String = "google"
        /// This is the name of the model. Ex. gpt-4o
        public let model: EvalGoogleModelModel
        /// This is the temperature of the model. For LLM-as-a-judge, it's recommended to set it between 0 - 0.3 to avoid hallucinations and ensure the model judges the output correctly based on the instructions.
        public let temperature: Double?
        /// This is the max tokens of the model.
        /// If your Judge instructions return `true` or `false` takes only 1 token (as per the OpenAI Tokenizer), and therefore is recommended to set it to a low number to force the model to return a short response.
        public let maxTokens: Double?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            model: EvalGoogleModelModel,
            temperature: Double? = nil,
            maxTokens: Double? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.model = model
            self.temperature = temperature
            self.maxTokens = maxTokens
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.model = try container.decode(EvalGoogleModelModel.self, forKey: .model)
            self.temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
            self.maxTokens = try container.decodeIfPresent(Double.self, forKey: .maxTokens)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.model, forKey: .model)
            try container.encodeIfPresent(self.temperature, forKey: .temperature)
            try container.encodeIfPresent(self.maxTokens, forKey: .maxTokens)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case model
            case temperature
            case maxTokens
        }
    }

    public struct CustomLlm: Codable, Hashable, Sendable {
        public let provider: String = "custom-llm"
        /// These is the URL we'll use for the OpenAI client's `baseURL`. Ex. https://openrouter.ai/api/v1
        public let url: String
        /// These are the headers we'll use for the OpenAI client's `headers`.
        public let headers: [String: JSONValue]?
        /// This sets the timeout for the connection to the custom provider without needing to stream any tokens back. Default is 20 seconds.
        public let timeoutSeconds: Double?
        /// This is the name of the model. Ex. gpt-4o
        public let model: String
        /// This is the temperature of the model. For LLM-as-a-judge, it's recommended to set it between 0 - 0.3 to avoid hallucinations and ensure the model judges the output correctly based on the instructions.
        public let temperature: Double?
        /// This is the max tokens of the model.
        /// If your Judge instructions return `true` or `false` takes only 1 token (as per the OpenAI Tokenizer), and therefore is recommended to set it to a low number to force the model to return a short response.
        public let maxTokens: Double?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            url: String,
            headers: [String: JSONValue]? = nil,
            timeoutSeconds: Double? = nil,
            model: String,
            temperature: Double? = nil,
            maxTokens: Double? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.url = url
            self.headers = headers
            self.timeoutSeconds = timeoutSeconds
            self.model = model
            self.temperature = temperature
            self.maxTokens = maxTokens
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.url = try container.decode(String.self, forKey: .url)
            self.headers = try container.decodeIfPresent([String: JSONValue].self, forKey: .headers)
            self.timeoutSeconds = try container.decodeIfPresent(Double.self, forKey: .timeoutSeconds)
            self.model = try container.decode(String.self, forKey: .model)
            self.temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
            self.maxTokens = try container.decodeIfPresent(Double.self, forKey: .maxTokens)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.url, forKey: .url)
            try container.encodeIfPresent(self.headers, forKey: .headers)
            try container.encodeIfPresent(self.timeoutSeconds, forKey: .timeoutSeconds)
            try container.encode(self.model, forKey: .model)
            try container.encodeIfPresent(self.temperature, forKey: .temperature)
            try container.encodeIfPresent(self.maxTokens, forKey: .maxTokens)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case url
            case headers
            case timeoutSeconds
            case model
            case temperature
            case maxTokens
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
    }
}