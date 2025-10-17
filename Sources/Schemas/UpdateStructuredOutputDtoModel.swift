import Foundation

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
public enum UpdateStructuredOutputDtoModel: Codable, Hashable, Sendable {
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
        public let model: WorkflowOpenAiModelModel
        /// This is the temperature of the model.
        public let temperature: Double?
        /// This is the max tokens of the model.
        public let maxTokens: Double?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            model: WorkflowOpenAiModelModel,
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
            self.model = try container.decode(WorkflowOpenAiModelModel.self, forKey: .model)
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
        /// This is the name of the model. Ex. cognitivecomputations/dolphin-mixtral-8x7b
        public let model: WorkflowGoogleModelModel
        /// This is the temperature of the model.
        public let temperature: Double?
        /// This is the max tokens of the model.
        public let maxTokens: Double?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            model: WorkflowGoogleModelModel,
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
            self.model = try container.decode(WorkflowGoogleModelModel.self, forKey: .model)
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
        /// This determines whether metadata is sent in requests to the custom provider.
        /// 
        /// - `off` will not send any metadata. payload will look like `{ messages }`
        /// - `variable` will send `assistant.metadata` as a variable on the payload. payload will look like `{ messages, metadata }`
        /// - `destructured` will send `assistant.metadata` fields directly on the payload. payload will look like `{ messages, ...metadata }`
        /// 
        /// Further, `variable` and `destructured` will send `call`, `phoneNumber`, and `customer` objects in the payload.
        /// 
        /// Default is `variable`.
        public let metadataSendMode: WorkflowCustomModelMetadataSendMode?
        /// These is the URL we'll use for the OpenAI client's `baseURL`. Ex. https://openrouter.ai/api/v1
        public let url: String
        /// These are the headers we'll use for the OpenAI client's `headers`.
        public let headers: [String: JSONValue]?
        /// This sets the timeout for the connection to the custom provider without needing to stream any tokens back. Default is 20 seconds.
        public let timeoutSeconds: Double?
        /// This is the name of the model. Ex. cognitivecomputations/dolphin-mixtral-8x7b
        public let model: String
        /// This is the temperature of the model.
        public let temperature: Double?
        /// This is the max tokens of the model.
        public let maxTokens: Double?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            metadataSendMode: WorkflowCustomModelMetadataSendMode? = nil,
            url: String,
            headers: [String: JSONValue]? = nil,
            timeoutSeconds: Double? = nil,
            model: String,
            temperature: Double? = nil,
            maxTokens: Double? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.metadataSendMode = metadataSendMode
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
            self.metadataSendMode = try container.decodeIfPresent(WorkflowCustomModelMetadataSendMode.self, forKey: .metadataSendMode)
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
            try container.encodeIfPresent(self.metadataSendMode, forKey: .metadataSendMode)
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
            case metadataSendMode
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