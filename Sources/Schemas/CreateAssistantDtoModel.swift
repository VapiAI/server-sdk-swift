import Foundation

/// These are the options for the assistant's LLM.
public enum CreateAssistantDtoModel: Codable, Hashable, Sendable {
    case anthropic(Anthropic)
    case anyscale(Anyscale)
    case cerebras(Cerebras)
    case customLlm(CustomLlm)
    case deepinfra(Deepinfra)
    case deepSeek(DeepSeek)
    case google(Google)
    case groq(Groq)
    case inflectionAi(InflectionAi)
    case openai(Openai)
    case openrouter(Openrouter)
    case perplexityAi(PerplexityAi)
    case togetherAi(TogetherAi)
    case xai(Xai)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .provider)
        switch discriminant {
        case "anthropic":
            self = .anthropic(try Anthropic(from: decoder))
        case "anyscale":
            self = .anyscale(try Anyscale(from: decoder))
        case "cerebras":
            self = .cerebras(try Cerebras(from: decoder))
        case "custom-llm":
            self = .customLlm(try CustomLlm(from: decoder))
        case "deepinfra":
            self = .deepinfra(try Deepinfra(from: decoder))
        case "deep-seek":
            self = .deepSeek(try DeepSeek(from: decoder))
        case "google":
            self = .google(try Google(from: decoder))
        case "groq":
            self = .groq(try Groq(from: decoder))
        case "inflection-ai":
            self = .inflectionAi(try InflectionAi(from: decoder))
        case "openai":
            self = .openai(try Openai(from: decoder))
        case "openrouter":
            self = .openrouter(try Openrouter(from: decoder))
        case "perplexity-ai":
            self = .perplexityAi(try PerplexityAi(from: decoder))
        case "together-ai":
            self = .togetherAi(try TogetherAi(from: decoder))
        case "xai":
            self = .xai(try Xai(from: decoder))
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
        case .anthropic(let data):
            try data.encode(to: encoder)
        case .anyscale(let data):
            try data.encode(to: encoder)
        case .cerebras(let data):
            try data.encode(to: encoder)
        case .customLlm(let data):
            try data.encode(to: encoder)
        case .deepinfra(let data):
            try data.encode(to: encoder)
        case .deepSeek(let data):
            try data.encode(to: encoder)
        case .google(let data):
            try data.encode(to: encoder)
        case .groq(let data):
            try data.encode(to: encoder)
        case .inflectionAi(let data):
            try data.encode(to: encoder)
        case .openai(let data):
            try data.encode(to: encoder)
        case .openrouter(let data):
            try data.encode(to: encoder)
        case .perplexityAi(let data):
            try data.encode(to: encoder)
        case .togetherAi(let data):
            try data.encode(to: encoder)
        case .xai(let data):
            try data.encode(to: encoder)
        }
    }

    public struct Anthropic: Codable, Hashable, Sendable {
        public let provider: String = "anthropic"
        /// This is the starting state for the conversation.
        public let messages: [OpenAiMessage]?
        /// These are the tools that the assistant can use during the call. To use existing tools, use `toolIds`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let tools: [AnthropicModelToolsItem]?
        /// These are the tools that the assistant can use during the call. To use transient tools, use `tools`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let toolIds: [String]?
        /// These are the options for the knowledge base.
        public let knowledgeBase: CreateCustomKnowledgeBaseDto?
        /// The specific Anthropic/Claude model that will be used.
        public let model: AnthropicModelModel
        /// Optional configuration for Anthropic's thinking feature.
        /// Only applicable for claude-3-7-sonnet-20250219 model.
        /// If provided, maxTokens must be greater than thinking.budgetTokens.
        public let thinking: AnthropicThinkingConfig?
        /// This is the temperature that will be used for calls. Default is 0 to leverage caching for lower latency.
        public let temperature: Double?
        /// This is the max number of tokens that the assistant will be allowed to generate in each turn of the conversation. Default is 250.
        public let maxTokens: Double?
        /// This determines whether we detect user's emotion while they speak and send it as an additional info to model.
        /// 
        /// Default `false` because the model is usually are good at understanding the user's emotion from text.
        /// 
        /// @default false
        public let emotionRecognitionEnabled: Bool?
        /// This sets how many turns at the start of the conversation to use a smaller, faster model from the same provider before switching to the primary model. Example, gpt-3.5-turbo if provider is openai.
        /// 
        /// Default is 0.
        /// 
        /// @default 0
        public let numFastTurns: Double?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [OpenAiMessage]? = nil,
            tools: [AnthropicModelToolsItem]? = nil,
            toolIds: [String]? = nil,
            knowledgeBase: CreateCustomKnowledgeBaseDto? = nil,
            model: AnthropicModelModel,
            thinking: AnthropicThinkingConfig? = nil,
            temperature: Double? = nil,
            maxTokens: Double? = nil,
            emotionRecognitionEnabled: Bool? = nil,
            numFastTurns: Double? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.tools = tools
            self.toolIds = toolIds
            self.knowledgeBase = knowledgeBase
            self.model = model
            self.thinking = thinking
            self.temperature = temperature
            self.maxTokens = maxTokens
            self.emotionRecognitionEnabled = emotionRecognitionEnabled
            self.numFastTurns = numFastTurns
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([OpenAiMessage].self, forKey: .messages)
            self.tools = try container.decodeIfPresent([AnthropicModelToolsItem].self, forKey: .tools)
            self.toolIds = try container.decodeIfPresent([String].self, forKey: .toolIds)
            self.knowledgeBase = try container.decodeIfPresent(CreateCustomKnowledgeBaseDto.self, forKey: .knowledgeBase)
            self.model = try container.decode(AnthropicModelModel.self, forKey: .model)
            self.thinking = try container.decodeIfPresent(AnthropicThinkingConfig.self, forKey: .thinking)
            self.temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
            self.maxTokens = try container.decodeIfPresent(Double.self, forKey: .maxTokens)
            self.emotionRecognitionEnabled = try container.decodeIfPresent(Bool.self, forKey: .emotionRecognitionEnabled)
            self.numFastTurns = try container.decodeIfPresent(Double.self, forKey: .numFastTurns)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encodeIfPresent(self.tools, forKey: .tools)
            try container.encodeIfPresent(self.toolIds, forKey: .toolIds)
            try container.encodeIfPresent(self.knowledgeBase, forKey: .knowledgeBase)
            try container.encode(self.model, forKey: .model)
            try container.encodeIfPresent(self.thinking, forKey: .thinking)
            try container.encodeIfPresent(self.temperature, forKey: .temperature)
            try container.encodeIfPresent(self.maxTokens, forKey: .maxTokens)
            try container.encodeIfPresent(self.emotionRecognitionEnabled, forKey: .emotionRecognitionEnabled)
            try container.encodeIfPresent(self.numFastTurns, forKey: .numFastTurns)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case messages
            case tools
            case toolIds
            case knowledgeBase
            case model
            case thinking
            case temperature
            case maxTokens
            case emotionRecognitionEnabled
            case numFastTurns
        }
    }

    public struct Anyscale: Codable, Hashable, Sendable {
        public let provider: String = "anyscale"
        /// This is the starting state for the conversation.
        public let messages: [OpenAiMessage]?
        /// These are the tools that the assistant can use during the call. To use existing tools, use `toolIds`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let tools: [AnyscaleModelToolsItem]?
        /// These are the tools that the assistant can use during the call. To use transient tools, use `tools`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let toolIds: [String]?
        /// These are the options for the knowledge base.
        public let knowledgeBase: CreateCustomKnowledgeBaseDto?
        /// This is the name of the model. Ex. cognitivecomputations/dolphin-mixtral-8x7b
        public let model: String
        /// This is the temperature that will be used for calls. Default is 0 to leverage caching for lower latency.
        public let temperature: Double?
        /// This is the max number of tokens that the assistant will be allowed to generate in each turn of the conversation. Default is 250.
        public let maxTokens: Double?
        /// This determines whether we detect user's emotion while they speak and send it as an additional info to model.
        /// 
        /// Default `false` because the model is usually are good at understanding the user's emotion from text.
        /// 
        /// @default false
        public let emotionRecognitionEnabled: Bool?
        /// This sets how many turns at the start of the conversation to use a smaller, faster model from the same provider before switching to the primary model. Example, gpt-3.5-turbo if provider is openai.
        /// 
        /// Default is 0.
        /// 
        /// @default 0
        public let numFastTurns: Double?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [OpenAiMessage]? = nil,
            tools: [AnyscaleModelToolsItem]? = nil,
            toolIds: [String]? = nil,
            knowledgeBase: CreateCustomKnowledgeBaseDto? = nil,
            model: String,
            temperature: Double? = nil,
            maxTokens: Double? = nil,
            emotionRecognitionEnabled: Bool? = nil,
            numFastTurns: Double? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.tools = tools
            self.toolIds = toolIds
            self.knowledgeBase = knowledgeBase
            self.model = model
            self.temperature = temperature
            self.maxTokens = maxTokens
            self.emotionRecognitionEnabled = emotionRecognitionEnabled
            self.numFastTurns = numFastTurns
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([OpenAiMessage].self, forKey: .messages)
            self.tools = try container.decodeIfPresent([AnyscaleModelToolsItem].self, forKey: .tools)
            self.toolIds = try container.decodeIfPresent([String].self, forKey: .toolIds)
            self.knowledgeBase = try container.decodeIfPresent(CreateCustomKnowledgeBaseDto.self, forKey: .knowledgeBase)
            self.model = try container.decode(String.self, forKey: .model)
            self.temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
            self.maxTokens = try container.decodeIfPresent(Double.self, forKey: .maxTokens)
            self.emotionRecognitionEnabled = try container.decodeIfPresent(Bool.self, forKey: .emotionRecognitionEnabled)
            self.numFastTurns = try container.decodeIfPresent(Double.self, forKey: .numFastTurns)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encodeIfPresent(self.tools, forKey: .tools)
            try container.encodeIfPresent(self.toolIds, forKey: .toolIds)
            try container.encodeIfPresent(self.knowledgeBase, forKey: .knowledgeBase)
            try container.encode(self.model, forKey: .model)
            try container.encodeIfPresent(self.temperature, forKey: .temperature)
            try container.encodeIfPresent(self.maxTokens, forKey: .maxTokens)
            try container.encodeIfPresent(self.emotionRecognitionEnabled, forKey: .emotionRecognitionEnabled)
            try container.encodeIfPresent(self.numFastTurns, forKey: .numFastTurns)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case messages
            case tools
            case toolIds
            case knowledgeBase
            case model
            case temperature
            case maxTokens
            case emotionRecognitionEnabled
            case numFastTurns
        }
    }

    public struct Cerebras: Codable, Hashable, Sendable {
        public let provider: String = "cerebras"
        /// This is the starting state for the conversation.
        public let messages: [OpenAiMessage]?
        /// These are the tools that the assistant can use during the call. To use existing tools, use `toolIds`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let tools: [CerebrasModelToolsItem]?
        /// These are the tools that the assistant can use during the call. To use transient tools, use `tools`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let toolIds: [String]?
        /// These are the options for the knowledge base.
        public let knowledgeBase: CreateCustomKnowledgeBaseDto?
        /// This is the name of the model. Ex. cognitivecomputations/dolphin-mixtral-8x7b
        public let model: CerebrasModelModel
        /// This is the temperature that will be used for calls. Default is 0 to leverage caching for lower latency.
        public let temperature: Double?
        /// This is the max number of tokens that the assistant will be allowed to generate in each turn of the conversation. Default is 250.
        public let maxTokens: Double?
        /// This determines whether we detect user's emotion while they speak and send it as an additional info to model.
        /// 
        /// Default `false` because the model is usually are good at understanding the user's emotion from text.
        /// 
        /// @default false
        public let emotionRecognitionEnabled: Bool?
        /// This sets how many turns at the start of the conversation to use a smaller, faster model from the same provider before switching to the primary model. Example, gpt-3.5-turbo if provider is openai.
        /// 
        /// Default is 0.
        /// 
        /// @default 0
        public let numFastTurns: Double?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [OpenAiMessage]? = nil,
            tools: [CerebrasModelToolsItem]? = nil,
            toolIds: [String]? = nil,
            knowledgeBase: CreateCustomKnowledgeBaseDto? = nil,
            model: CerebrasModelModel,
            temperature: Double? = nil,
            maxTokens: Double? = nil,
            emotionRecognitionEnabled: Bool? = nil,
            numFastTurns: Double? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.tools = tools
            self.toolIds = toolIds
            self.knowledgeBase = knowledgeBase
            self.model = model
            self.temperature = temperature
            self.maxTokens = maxTokens
            self.emotionRecognitionEnabled = emotionRecognitionEnabled
            self.numFastTurns = numFastTurns
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([OpenAiMessage].self, forKey: .messages)
            self.tools = try container.decodeIfPresent([CerebrasModelToolsItem].self, forKey: .tools)
            self.toolIds = try container.decodeIfPresent([String].self, forKey: .toolIds)
            self.knowledgeBase = try container.decodeIfPresent(CreateCustomKnowledgeBaseDto.self, forKey: .knowledgeBase)
            self.model = try container.decode(CerebrasModelModel.self, forKey: .model)
            self.temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
            self.maxTokens = try container.decodeIfPresent(Double.self, forKey: .maxTokens)
            self.emotionRecognitionEnabled = try container.decodeIfPresent(Bool.self, forKey: .emotionRecognitionEnabled)
            self.numFastTurns = try container.decodeIfPresent(Double.self, forKey: .numFastTurns)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encodeIfPresent(self.tools, forKey: .tools)
            try container.encodeIfPresent(self.toolIds, forKey: .toolIds)
            try container.encodeIfPresent(self.knowledgeBase, forKey: .knowledgeBase)
            try container.encode(self.model, forKey: .model)
            try container.encodeIfPresent(self.temperature, forKey: .temperature)
            try container.encodeIfPresent(self.maxTokens, forKey: .maxTokens)
            try container.encodeIfPresent(self.emotionRecognitionEnabled, forKey: .emotionRecognitionEnabled)
            try container.encodeIfPresent(self.numFastTurns, forKey: .numFastTurns)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case messages
            case tools
            case toolIds
            case knowledgeBase
            case model
            case temperature
            case maxTokens
            case emotionRecognitionEnabled
            case numFastTurns
        }
    }

    public struct CustomLlm: Codable, Hashable, Sendable {
        public let provider: String = "custom-llm"
        /// This is the starting state for the conversation.
        public let messages: [OpenAiMessage]?
        /// These are the tools that the assistant can use during the call. To use existing tools, use `toolIds`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let tools: [CustomLlmModelToolsItem]?
        /// These are the tools that the assistant can use during the call. To use transient tools, use `tools`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let toolIds: [String]?
        /// These are the options for the knowledge base.
        public let knowledgeBase: CreateCustomKnowledgeBaseDto?
        /// This determines whether metadata is sent in requests to the custom provider.
        /// 
        /// - `off` will not send any metadata. payload will look like `{ messages }`
        /// - `variable` will send `assistant.metadata` as a variable on the payload. payload will look like `{ messages, metadata }`
        /// - `destructured` will send `assistant.metadata` fields directly on the payload. payload will look like `{ messages, ...metadata }`
        /// 
        /// Further, `variable` and `destructured` will send `call`, `phoneNumber`, and `customer` objects in the payload.
        /// 
        /// Default is `variable`.
        public let metadataSendMode: CustomLlmModelMetadataSendMode?
        /// Custom headers to send with requests. These headers can override default OpenAI headers except for Authorization (which should be specified using a custom-llm credential).
        public let headers: [String: String]?
        /// These is the URL we'll use for the OpenAI client's `baseURL`. Ex. https://openrouter.ai/api/v1
        public let url: String
        /// This determines whether the transcriber's word level confidence is sent in requests to the custom provider. Default is false.
        /// This only works for Deepgram transcribers.
        public let wordLevelConfidenceEnabled: Bool?
        /// This sets the timeout for the connection to the custom provider without needing to stream any tokens back. Default is 20 seconds.
        public let timeoutSeconds: Double?
        /// This is the name of the model. Ex. cognitivecomputations/dolphin-mixtral-8x7b
        public let model: String
        /// This is the temperature that will be used for calls. Default is 0 to leverage caching for lower latency.
        public let temperature: Double?
        /// This is the max number of tokens that the assistant will be allowed to generate in each turn of the conversation. Default is 250.
        public let maxTokens: Double?
        /// This determines whether we detect user's emotion while they speak and send it as an additional info to model.
        /// 
        /// Default `false` because the model is usually are good at understanding the user's emotion from text.
        /// 
        /// @default false
        public let emotionRecognitionEnabled: Bool?
        /// This sets how many turns at the start of the conversation to use a smaller, faster model from the same provider before switching to the primary model. Example, gpt-3.5-turbo if provider is openai.
        /// 
        /// Default is 0.
        /// 
        /// @default 0
        public let numFastTurns: Double?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [OpenAiMessage]? = nil,
            tools: [CustomLlmModelToolsItem]? = nil,
            toolIds: [String]? = nil,
            knowledgeBase: CreateCustomKnowledgeBaseDto? = nil,
            metadataSendMode: CustomLlmModelMetadataSendMode? = nil,
            headers: [String: String]? = nil,
            url: String,
            wordLevelConfidenceEnabled: Bool? = nil,
            timeoutSeconds: Double? = nil,
            model: String,
            temperature: Double? = nil,
            maxTokens: Double? = nil,
            emotionRecognitionEnabled: Bool? = nil,
            numFastTurns: Double? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.tools = tools
            self.toolIds = toolIds
            self.knowledgeBase = knowledgeBase
            self.metadataSendMode = metadataSendMode
            self.headers = headers
            self.url = url
            self.wordLevelConfidenceEnabled = wordLevelConfidenceEnabled
            self.timeoutSeconds = timeoutSeconds
            self.model = model
            self.temperature = temperature
            self.maxTokens = maxTokens
            self.emotionRecognitionEnabled = emotionRecognitionEnabled
            self.numFastTurns = numFastTurns
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([OpenAiMessage].self, forKey: .messages)
            self.tools = try container.decodeIfPresent([CustomLlmModelToolsItem].self, forKey: .tools)
            self.toolIds = try container.decodeIfPresent([String].self, forKey: .toolIds)
            self.knowledgeBase = try container.decodeIfPresent(CreateCustomKnowledgeBaseDto.self, forKey: .knowledgeBase)
            self.metadataSendMode = try container.decodeIfPresent(CustomLlmModelMetadataSendMode.self, forKey: .metadataSendMode)
            self.headers = try container.decodeIfPresent([String: String].self, forKey: .headers)
            self.url = try container.decode(String.self, forKey: .url)
            self.wordLevelConfidenceEnabled = try container.decodeIfPresent(Bool.self, forKey: .wordLevelConfidenceEnabled)
            self.timeoutSeconds = try container.decodeIfPresent(Double.self, forKey: .timeoutSeconds)
            self.model = try container.decode(String.self, forKey: .model)
            self.temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
            self.maxTokens = try container.decodeIfPresent(Double.self, forKey: .maxTokens)
            self.emotionRecognitionEnabled = try container.decodeIfPresent(Bool.self, forKey: .emotionRecognitionEnabled)
            self.numFastTurns = try container.decodeIfPresent(Double.self, forKey: .numFastTurns)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encodeIfPresent(self.tools, forKey: .tools)
            try container.encodeIfPresent(self.toolIds, forKey: .toolIds)
            try container.encodeIfPresent(self.knowledgeBase, forKey: .knowledgeBase)
            try container.encodeIfPresent(self.metadataSendMode, forKey: .metadataSendMode)
            try container.encodeIfPresent(self.headers, forKey: .headers)
            try container.encode(self.url, forKey: .url)
            try container.encodeIfPresent(self.wordLevelConfidenceEnabled, forKey: .wordLevelConfidenceEnabled)
            try container.encodeIfPresent(self.timeoutSeconds, forKey: .timeoutSeconds)
            try container.encode(self.model, forKey: .model)
            try container.encodeIfPresent(self.temperature, forKey: .temperature)
            try container.encodeIfPresent(self.maxTokens, forKey: .maxTokens)
            try container.encodeIfPresent(self.emotionRecognitionEnabled, forKey: .emotionRecognitionEnabled)
            try container.encodeIfPresent(self.numFastTurns, forKey: .numFastTurns)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case messages
            case tools
            case toolIds
            case knowledgeBase
            case metadataSendMode
            case headers
            case url
            case wordLevelConfidenceEnabled
            case timeoutSeconds
            case model
            case temperature
            case maxTokens
            case emotionRecognitionEnabled
            case numFastTurns
        }
    }

    public struct Deepinfra: Codable, Hashable, Sendable {
        public let provider: String = "deepinfra"
        /// This is the starting state for the conversation.
        public let messages: [OpenAiMessage]?
        /// These are the tools that the assistant can use during the call. To use existing tools, use `toolIds`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let tools: [DeepInfraModelToolsItem]?
        /// These are the tools that the assistant can use during the call. To use transient tools, use `tools`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let toolIds: [String]?
        /// These are the options for the knowledge base.
        public let knowledgeBase: CreateCustomKnowledgeBaseDto?
        /// This is the name of the model. Ex. cognitivecomputations/dolphin-mixtral-8x7b
        public let model: String
        /// This is the temperature that will be used for calls. Default is 0 to leverage caching for lower latency.
        public let temperature: Double?
        /// This is the max number of tokens that the assistant will be allowed to generate in each turn of the conversation. Default is 250.
        public let maxTokens: Double?
        /// This determines whether we detect user's emotion while they speak and send it as an additional info to model.
        /// 
        /// Default `false` because the model is usually are good at understanding the user's emotion from text.
        /// 
        /// @default false
        public let emotionRecognitionEnabled: Bool?
        /// This sets how many turns at the start of the conversation to use a smaller, faster model from the same provider before switching to the primary model. Example, gpt-3.5-turbo if provider is openai.
        /// 
        /// Default is 0.
        /// 
        /// @default 0
        public let numFastTurns: Double?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [OpenAiMessage]? = nil,
            tools: [DeepInfraModelToolsItem]? = nil,
            toolIds: [String]? = nil,
            knowledgeBase: CreateCustomKnowledgeBaseDto? = nil,
            model: String,
            temperature: Double? = nil,
            maxTokens: Double? = nil,
            emotionRecognitionEnabled: Bool? = nil,
            numFastTurns: Double? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.tools = tools
            self.toolIds = toolIds
            self.knowledgeBase = knowledgeBase
            self.model = model
            self.temperature = temperature
            self.maxTokens = maxTokens
            self.emotionRecognitionEnabled = emotionRecognitionEnabled
            self.numFastTurns = numFastTurns
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([OpenAiMessage].self, forKey: .messages)
            self.tools = try container.decodeIfPresent([DeepInfraModelToolsItem].self, forKey: .tools)
            self.toolIds = try container.decodeIfPresent([String].self, forKey: .toolIds)
            self.knowledgeBase = try container.decodeIfPresent(CreateCustomKnowledgeBaseDto.self, forKey: .knowledgeBase)
            self.model = try container.decode(String.self, forKey: .model)
            self.temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
            self.maxTokens = try container.decodeIfPresent(Double.self, forKey: .maxTokens)
            self.emotionRecognitionEnabled = try container.decodeIfPresent(Bool.self, forKey: .emotionRecognitionEnabled)
            self.numFastTurns = try container.decodeIfPresent(Double.self, forKey: .numFastTurns)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encodeIfPresent(self.tools, forKey: .tools)
            try container.encodeIfPresent(self.toolIds, forKey: .toolIds)
            try container.encodeIfPresent(self.knowledgeBase, forKey: .knowledgeBase)
            try container.encode(self.model, forKey: .model)
            try container.encodeIfPresent(self.temperature, forKey: .temperature)
            try container.encodeIfPresent(self.maxTokens, forKey: .maxTokens)
            try container.encodeIfPresent(self.emotionRecognitionEnabled, forKey: .emotionRecognitionEnabled)
            try container.encodeIfPresent(self.numFastTurns, forKey: .numFastTurns)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case messages
            case tools
            case toolIds
            case knowledgeBase
            case model
            case temperature
            case maxTokens
            case emotionRecognitionEnabled
            case numFastTurns
        }
    }

    public struct DeepSeek: Codable, Hashable, Sendable {
        public let provider: String = "deep-seek"
        /// This is the starting state for the conversation.
        public let messages: [OpenAiMessage]?
        /// These are the tools that the assistant can use during the call. To use existing tools, use `toolIds`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let tools: [DeepSeekModelToolsItem]?
        /// These are the tools that the assistant can use during the call. To use transient tools, use `tools`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let toolIds: [String]?
        /// These are the options for the knowledge base.
        public let knowledgeBase: CreateCustomKnowledgeBaseDto?
        /// This is the name of the model. Ex. cognitivecomputations/dolphin-mixtral-8x7b
        public let model: DeepSeekModelModel
        /// This is the temperature that will be used for calls. Default is 0 to leverage caching for lower latency.
        public let temperature: Double?
        /// This is the max number of tokens that the assistant will be allowed to generate in each turn of the conversation. Default is 250.
        public let maxTokens: Double?
        /// This determines whether we detect user's emotion while they speak and send it as an additional info to model.
        /// 
        /// Default `false` because the model is usually are good at understanding the user's emotion from text.
        /// 
        /// @default false
        public let emotionRecognitionEnabled: Bool?
        /// This sets how many turns at the start of the conversation to use a smaller, faster model from the same provider before switching to the primary model. Example, gpt-3.5-turbo if provider is openai.
        /// 
        /// Default is 0.
        /// 
        /// @default 0
        public let numFastTurns: Double?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [OpenAiMessage]? = nil,
            tools: [DeepSeekModelToolsItem]? = nil,
            toolIds: [String]? = nil,
            knowledgeBase: CreateCustomKnowledgeBaseDto? = nil,
            model: DeepSeekModelModel,
            temperature: Double? = nil,
            maxTokens: Double? = nil,
            emotionRecognitionEnabled: Bool? = nil,
            numFastTurns: Double? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.tools = tools
            self.toolIds = toolIds
            self.knowledgeBase = knowledgeBase
            self.model = model
            self.temperature = temperature
            self.maxTokens = maxTokens
            self.emotionRecognitionEnabled = emotionRecognitionEnabled
            self.numFastTurns = numFastTurns
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([OpenAiMessage].self, forKey: .messages)
            self.tools = try container.decodeIfPresent([DeepSeekModelToolsItem].self, forKey: .tools)
            self.toolIds = try container.decodeIfPresent([String].self, forKey: .toolIds)
            self.knowledgeBase = try container.decodeIfPresent(CreateCustomKnowledgeBaseDto.self, forKey: .knowledgeBase)
            self.model = try container.decode(DeepSeekModelModel.self, forKey: .model)
            self.temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
            self.maxTokens = try container.decodeIfPresent(Double.self, forKey: .maxTokens)
            self.emotionRecognitionEnabled = try container.decodeIfPresent(Bool.self, forKey: .emotionRecognitionEnabled)
            self.numFastTurns = try container.decodeIfPresent(Double.self, forKey: .numFastTurns)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encodeIfPresent(self.tools, forKey: .tools)
            try container.encodeIfPresent(self.toolIds, forKey: .toolIds)
            try container.encodeIfPresent(self.knowledgeBase, forKey: .knowledgeBase)
            try container.encode(self.model, forKey: .model)
            try container.encodeIfPresent(self.temperature, forKey: .temperature)
            try container.encodeIfPresent(self.maxTokens, forKey: .maxTokens)
            try container.encodeIfPresent(self.emotionRecognitionEnabled, forKey: .emotionRecognitionEnabled)
            try container.encodeIfPresent(self.numFastTurns, forKey: .numFastTurns)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case messages
            case tools
            case toolIds
            case knowledgeBase
            case model
            case temperature
            case maxTokens
            case emotionRecognitionEnabled
            case numFastTurns
        }
    }

    public struct Google: Codable, Hashable, Sendable {
        public let provider: String = "google"
        /// This is the starting state for the conversation.
        public let messages: [OpenAiMessage]?
        /// These are the tools that the assistant can use during the call. To use existing tools, use `toolIds`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let tools: [GoogleModelToolsItem]?
        /// These are the tools that the assistant can use during the call. To use transient tools, use `tools`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let toolIds: [String]?
        /// These are the options for the knowledge base.
        public let knowledgeBase: CreateCustomKnowledgeBaseDto?
        /// This is the Google model that will be used.
        public let model: GoogleModelModel
        /// This is the session configuration for the Gemini Flash 2.0 Multimodal Live API.
        /// Only applicable if the model `gemini-2.0-flash-realtime-exp` is selected.
        public let realtimeConfig: GoogleRealtimeConfig?
        /// This is the temperature that will be used for calls. Default is 0 to leverage caching for lower latency.
        public let temperature: Double?
        /// This is the max number of tokens that the assistant will be allowed to generate in each turn of the conversation. Default is 250.
        public let maxTokens: Double?
        /// This determines whether we detect user's emotion while they speak and send it as an additional info to model.
        /// 
        /// Default `false` because the model is usually are good at understanding the user's emotion from text.
        /// 
        /// @default false
        public let emotionRecognitionEnabled: Bool?
        /// This sets how many turns at the start of the conversation to use a smaller, faster model from the same provider before switching to the primary model. Example, gpt-3.5-turbo if provider is openai.
        /// 
        /// Default is 0.
        /// 
        /// @default 0
        public let numFastTurns: Double?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [OpenAiMessage]? = nil,
            tools: [GoogleModelToolsItem]? = nil,
            toolIds: [String]? = nil,
            knowledgeBase: CreateCustomKnowledgeBaseDto? = nil,
            model: GoogleModelModel,
            realtimeConfig: GoogleRealtimeConfig? = nil,
            temperature: Double? = nil,
            maxTokens: Double? = nil,
            emotionRecognitionEnabled: Bool? = nil,
            numFastTurns: Double? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.tools = tools
            self.toolIds = toolIds
            self.knowledgeBase = knowledgeBase
            self.model = model
            self.realtimeConfig = realtimeConfig
            self.temperature = temperature
            self.maxTokens = maxTokens
            self.emotionRecognitionEnabled = emotionRecognitionEnabled
            self.numFastTurns = numFastTurns
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([OpenAiMessage].self, forKey: .messages)
            self.tools = try container.decodeIfPresent([GoogleModelToolsItem].self, forKey: .tools)
            self.toolIds = try container.decodeIfPresent([String].self, forKey: .toolIds)
            self.knowledgeBase = try container.decodeIfPresent(CreateCustomKnowledgeBaseDto.self, forKey: .knowledgeBase)
            self.model = try container.decode(GoogleModelModel.self, forKey: .model)
            self.realtimeConfig = try container.decodeIfPresent(GoogleRealtimeConfig.self, forKey: .realtimeConfig)
            self.temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
            self.maxTokens = try container.decodeIfPresent(Double.self, forKey: .maxTokens)
            self.emotionRecognitionEnabled = try container.decodeIfPresent(Bool.self, forKey: .emotionRecognitionEnabled)
            self.numFastTurns = try container.decodeIfPresent(Double.self, forKey: .numFastTurns)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encodeIfPresent(self.tools, forKey: .tools)
            try container.encodeIfPresent(self.toolIds, forKey: .toolIds)
            try container.encodeIfPresent(self.knowledgeBase, forKey: .knowledgeBase)
            try container.encode(self.model, forKey: .model)
            try container.encodeIfPresent(self.realtimeConfig, forKey: .realtimeConfig)
            try container.encodeIfPresent(self.temperature, forKey: .temperature)
            try container.encodeIfPresent(self.maxTokens, forKey: .maxTokens)
            try container.encodeIfPresent(self.emotionRecognitionEnabled, forKey: .emotionRecognitionEnabled)
            try container.encodeIfPresent(self.numFastTurns, forKey: .numFastTurns)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case messages
            case tools
            case toolIds
            case knowledgeBase
            case model
            case realtimeConfig
            case temperature
            case maxTokens
            case emotionRecognitionEnabled
            case numFastTurns
        }
    }

    public struct Groq: Codable, Hashable, Sendable {
        public let provider: String = "groq"
        /// This is the starting state for the conversation.
        public let messages: [OpenAiMessage]?
        /// These are the tools that the assistant can use during the call. To use existing tools, use `toolIds`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let tools: [GroqModelToolsItem]?
        /// These are the tools that the assistant can use during the call. To use transient tools, use `tools`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let toolIds: [String]?
        /// These are the options for the knowledge base.
        public let knowledgeBase: CreateCustomKnowledgeBaseDto?
        /// This is the name of the model. Ex. cognitivecomputations/dolphin-mixtral-8x7b
        public let model: GroqModelModel
        /// This is the temperature that will be used for calls. Default is 0 to leverage caching for lower latency.
        public let temperature: Double?
        /// This is the max number of tokens that the assistant will be allowed to generate in each turn of the conversation. Default is 250.
        public let maxTokens: Double?
        /// This determines whether we detect user's emotion while they speak and send it as an additional info to model.
        /// 
        /// Default `false` because the model is usually are good at understanding the user's emotion from text.
        /// 
        /// @default false
        public let emotionRecognitionEnabled: Bool?
        /// This sets how many turns at the start of the conversation to use a smaller, faster model from the same provider before switching to the primary model. Example, gpt-3.5-turbo if provider is openai.
        /// 
        /// Default is 0.
        /// 
        /// @default 0
        public let numFastTurns: Double?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [OpenAiMessage]? = nil,
            tools: [GroqModelToolsItem]? = nil,
            toolIds: [String]? = nil,
            knowledgeBase: CreateCustomKnowledgeBaseDto? = nil,
            model: GroqModelModel,
            temperature: Double? = nil,
            maxTokens: Double? = nil,
            emotionRecognitionEnabled: Bool? = nil,
            numFastTurns: Double? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.tools = tools
            self.toolIds = toolIds
            self.knowledgeBase = knowledgeBase
            self.model = model
            self.temperature = temperature
            self.maxTokens = maxTokens
            self.emotionRecognitionEnabled = emotionRecognitionEnabled
            self.numFastTurns = numFastTurns
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([OpenAiMessage].self, forKey: .messages)
            self.tools = try container.decodeIfPresent([GroqModelToolsItem].self, forKey: .tools)
            self.toolIds = try container.decodeIfPresent([String].self, forKey: .toolIds)
            self.knowledgeBase = try container.decodeIfPresent(CreateCustomKnowledgeBaseDto.self, forKey: .knowledgeBase)
            self.model = try container.decode(GroqModelModel.self, forKey: .model)
            self.temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
            self.maxTokens = try container.decodeIfPresent(Double.self, forKey: .maxTokens)
            self.emotionRecognitionEnabled = try container.decodeIfPresent(Bool.self, forKey: .emotionRecognitionEnabled)
            self.numFastTurns = try container.decodeIfPresent(Double.self, forKey: .numFastTurns)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encodeIfPresent(self.tools, forKey: .tools)
            try container.encodeIfPresent(self.toolIds, forKey: .toolIds)
            try container.encodeIfPresent(self.knowledgeBase, forKey: .knowledgeBase)
            try container.encode(self.model, forKey: .model)
            try container.encodeIfPresent(self.temperature, forKey: .temperature)
            try container.encodeIfPresent(self.maxTokens, forKey: .maxTokens)
            try container.encodeIfPresent(self.emotionRecognitionEnabled, forKey: .emotionRecognitionEnabled)
            try container.encodeIfPresent(self.numFastTurns, forKey: .numFastTurns)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case messages
            case tools
            case toolIds
            case knowledgeBase
            case model
            case temperature
            case maxTokens
            case emotionRecognitionEnabled
            case numFastTurns
        }
    }

    public struct InflectionAi: Codable, Hashable, Sendable {
        public let provider: String = "inflection-ai"
        /// This is the starting state for the conversation.
        public let messages: [OpenAiMessage]?
        /// These are the tools that the assistant can use during the call. To use existing tools, use `toolIds`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let tools: [InflectionAiModelToolsItem]?
        /// These are the tools that the assistant can use during the call. To use transient tools, use `tools`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let toolIds: [String]?
        /// These are the options for the knowledge base.
        public let knowledgeBase: CreateCustomKnowledgeBaseDto?
        /// This is the name of the model. Ex. cognitivecomputations/dolphin-mixtral-8x7b
        public let model: Inflection3Pi
        /// This is the temperature that will be used for calls. Default is 0 to leverage caching for lower latency.
        public let temperature: Double?
        /// This is the max number of tokens that the assistant will be allowed to generate in each turn of the conversation. Default is 250.
        public let maxTokens: Double?
        /// This determines whether we detect user's emotion while they speak and send it as an additional info to model.
        /// 
        /// Default `false` because the model is usually are good at understanding the user's emotion from text.
        /// 
        /// @default false
        public let emotionRecognitionEnabled: Bool?
        /// This sets how many turns at the start of the conversation to use a smaller, faster model from the same provider before switching to the primary model. Example, gpt-3.5-turbo if provider is openai.
        /// 
        /// Default is 0.
        /// 
        /// @default 0
        public let numFastTurns: Double?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [OpenAiMessage]? = nil,
            tools: [InflectionAiModelToolsItem]? = nil,
            toolIds: [String]? = nil,
            knowledgeBase: CreateCustomKnowledgeBaseDto? = nil,
            model: Inflection3Pi,
            temperature: Double? = nil,
            maxTokens: Double? = nil,
            emotionRecognitionEnabled: Bool? = nil,
            numFastTurns: Double? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.tools = tools
            self.toolIds = toolIds
            self.knowledgeBase = knowledgeBase
            self.model = model
            self.temperature = temperature
            self.maxTokens = maxTokens
            self.emotionRecognitionEnabled = emotionRecognitionEnabled
            self.numFastTurns = numFastTurns
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([OpenAiMessage].self, forKey: .messages)
            self.tools = try container.decodeIfPresent([InflectionAiModelToolsItem].self, forKey: .tools)
            self.toolIds = try container.decodeIfPresent([String].self, forKey: .toolIds)
            self.knowledgeBase = try container.decodeIfPresent(CreateCustomKnowledgeBaseDto.self, forKey: .knowledgeBase)
            self.model = try container.decode(Inflection3Pi.self, forKey: .model)
            self.temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
            self.maxTokens = try container.decodeIfPresent(Double.self, forKey: .maxTokens)
            self.emotionRecognitionEnabled = try container.decodeIfPresent(Bool.self, forKey: .emotionRecognitionEnabled)
            self.numFastTurns = try container.decodeIfPresent(Double.self, forKey: .numFastTurns)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encodeIfPresent(self.tools, forKey: .tools)
            try container.encodeIfPresent(self.toolIds, forKey: .toolIds)
            try container.encodeIfPresent(self.knowledgeBase, forKey: .knowledgeBase)
            try container.encode(self.model, forKey: .model)
            try container.encodeIfPresent(self.temperature, forKey: .temperature)
            try container.encodeIfPresent(self.maxTokens, forKey: .maxTokens)
            try container.encodeIfPresent(self.emotionRecognitionEnabled, forKey: .emotionRecognitionEnabled)
            try container.encodeIfPresent(self.numFastTurns, forKey: .numFastTurns)
        }

        public enum Inflection3Pi: String, Codable, Hashable, CaseIterable, Sendable {
            case inflection3Pi = "inflection_3_pi"
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case messages
            case tools
            case toolIds
            case knowledgeBase
            case model
            case temperature
            case maxTokens
            case emotionRecognitionEnabled
            case numFastTurns
        }
    }

    public struct Openai: Codable, Hashable, Sendable {
        public let provider: String = "openai"
        /// This is the starting state for the conversation.
        public let messages: [OpenAiMessage]?
        /// These are the tools that the assistant can use during the call. To use existing tools, use `toolIds`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let tools: [OpenAiModelToolsItem]?
        /// These are the tools that the assistant can use during the call. To use transient tools, use `tools`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let toolIds: [String]?
        /// These are the options for the knowledge base.
        public let knowledgeBase: CreateCustomKnowledgeBaseDto?
        /// This is the OpenAI model that will be used.
        /// 
        /// When using Vapi OpenAI or your own Azure Credentials, you have the option to specify the region for the selected model. This shouldn't be specified unless you have a specific reason to do so. Vapi will automatically find the fastest region that make sense.
        /// This is helpful when you are required to comply with Data Residency rules. Learn more about Azure regions here https://azure.microsoft.com/en-us/explore/global-infrastructure/data-residency/.
        /// 
        /// @default undefined
        public let model: OpenAiModelModel
        /// These are the fallback models that will be used if the primary model fails. This shouldn't be specified unless you have a specific reason to do so. Vapi will automatically find the fastest fallbacks that make sense.
        public let fallbackModels: [OpenAiModelFallbackModelsItem]?
        /// Azure OpenAI doesn't support `maxLength` right now https://learn.microsoft.com/en-us/azure/ai-services/openai/how-to/structured-outputs?tabs=python-secure%2Cdotnet-entra-id&pivots=programming-language-csharp#unsupported-type-specific-keywords. Need to strip.
        /// 
        /// - `strip-parameters-with-unsupported-validation` will strip parameters with unsupported validation.
        /// - `strip-unsupported-validation` will keep the parameters but strip unsupported validation.
        /// 
        /// @default `strip-unsupported-validation`
        public let toolStrictCompatibilityMode: OpenAiModelToolStrictCompatibilityMode?
        /// This is the temperature that will be used for calls. Default is 0 to leverage caching for lower latency.
        public let temperature: Double?
        /// This is the max number of tokens that the assistant will be allowed to generate in each turn of the conversation. Default is 250.
        public let maxTokens: Double?
        /// This determines whether we detect user's emotion while they speak and send it as an additional info to model.
        /// 
        /// Default `false` because the model is usually are good at understanding the user's emotion from text.
        /// 
        /// @default false
        public let emotionRecognitionEnabled: Bool?
        /// This sets how many turns at the start of the conversation to use a smaller, faster model from the same provider before switching to the primary model. Example, gpt-3.5-turbo if provider is openai.
        /// 
        /// Default is 0.
        /// 
        /// @default 0
        public let numFastTurns: Double?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [OpenAiMessage]? = nil,
            tools: [OpenAiModelToolsItem]? = nil,
            toolIds: [String]? = nil,
            knowledgeBase: CreateCustomKnowledgeBaseDto? = nil,
            model: OpenAiModelModel,
            fallbackModels: [OpenAiModelFallbackModelsItem]? = nil,
            toolStrictCompatibilityMode: OpenAiModelToolStrictCompatibilityMode? = nil,
            temperature: Double? = nil,
            maxTokens: Double? = nil,
            emotionRecognitionEnabled: Bool? = nil,
            numFastTurns: Double? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.tools = tools
            self.toolIds = toolIds
            self.knowledgeBase = knowledgeBase
            self.model = model
            self.fallbackModels = fallbackModels
            self.toolStrictCompatibilityMode = toolStrictCompatibilityMode
            self.temperature = temperature
            self.maxTokens = maxTokens
            self.emotionRecognitionEnabled = emotionRecognitionEnabled
            self.numFastTurns = numFastTurns
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([OpenAiMessage].self, forKey: .messages)
            self.tools = try container.decodeIfPresent([OpenAiModelToolsItem].self, forKey: .tools)
            self.toolIds = try container.decodeIfPresent([String].self, forKey: .toolIds)
            self.knowledgeBase = try container.decodeIfPresent(CreateCustomKnowledgeBaseDto.self, forKey: .knowledgeBase)
            self.model = try container.decode(OpenAiModelModel.self, forKey: .model)
            self.fallbackModels = try container.decodeIfPresent([OpenAiModelFallbackModelsItem].self, forKey: .fallbackModels)
            self.toolStrictCompatibilityMode = try container.decodeIfPresent(OpenAiModelToolStrictCompatibilityMode.self, forKey: .toolStrictCompatibilityMode)
            self.temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
            self.maxTokens = try container.decodeIfPresent(Double.self, forKey: .maxTokens)
            self.emotionRecognitionEnabled = try container.decodeIfPresent(Bool.self, forKey: .emotionRecognitionEnabled)
            self.numFastTurns = try container.decodeIfPresent(Double.self, forKey: .numFastTurns)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encodeIfPresent(self.tools, forKey: .tools)
            try container.encodeIfPresent(self.toolIds, forKey: .toolIds)
            try container.encodeIfPresent(self.knowledgeBase, forKey: .knowledgeBase)
            try container.encode(self.model, forKey: .model)
            try container.encodeIfPresent(self.fallbackModels, forKey: .fallbackModels)
            try container.encodeIfPresent(self.toolStrictCompatibilityMode, forKey: .toolStrictCompatibilityMode)
            try container.encodeIfPresent(self.temperature, forKey: .temperature)
            try container.encodeIfPresent(self.maxTokens, forKey: .maxTokens)
            try container.encodeIfPresent(self.emotionRecognitionEnabled, forKey: .emotionRecognitionEnabled)
            try container.encodeIfPresent(self.numFastTurns, forKey: .numFastTurns)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case messages
            case tools
            case toolIds
            case knowledgeBase
            case model
            case fallbackModels
            case toolStrictCompatibilityMode
            case temperature
            case maxTokens
            case emotionRecognitionEnabled
            case numFastTurns
        }
    }

    public struct Openrouter: Codable, Hashable, Sendable {
        public let provider: String = "openrouter"
        /// This is the starting state for the conversation.
        public let messages: [OpenAiMessage]?
        /// These are the tools that the assistant can use during the call. To use existing tools, use `toolIds`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let tools: [OpenRouterModelToolsItem]?
        /// These are the tools that the assistant can use during the call. To use transient tools, use `tools`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let toolIds: [String]?
        /// These are the options for the knowledge base.
        public let knowledgeBase: CreateCustomKnowledgeBaseDto?
        /// This is the name of the model. Ex. cognitivecomputations/dolphin-mixtral-8x7b
        public let model: String
        /// This is the temperature that will be used for calls. Default is 0 to leverage caching for lower latency.
        public let temperature: Double?
        /// This is the max number of tokens that the assistant will be allowed to generate in each turn of the conversation. Default is 250.
        public let maxTokens: Double?
        /// This determines whether we detect user's emotion while they speak and send it as an additional info to model.
        /// 
        /// Default `false` because the model is usually are good at understanding the user's emotion from text.
        /// 
        /// @default false
        public let emotionRecognitionEnabled: Bool?
        /// This sets how many turns at the start of the conversation to use a smaller, faster model from the same provider before switching to the primary model. Example, gpt-3.5-turbo if provider is openai.
        /// 
        /// Default is 0.
        /// 
        /// @default 0
        public let numFastTurns: Double?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [OpenAiMessage]? = nil,
            tools: [OpenRouterModelToolsItem]? = nil,
            toolIds: [String]? = nil,
            knowledgeBase: CreateCustomKnowledgeBaseDto? = nil,
            model: String,
            temperature: Double? = nil,
            maxTokens: Double? = nil,
            emotionRecognitionEnabled: Bool? = nil,
            numFastTurns: Double? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.tools = tools
            self.toolIds = toolIds
            self.knowledgeBase = knowledgeBase
            self.model = model
            self.temperature = temperature
            self.maxTokens = maxTokens
            self.emotionRecognitionEnabled = emotionRecognitionEnabled
            self.numFastTurns = numFastTurns
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([OpenAiMessage].self, forKey: .messages)
            self.tools = try container.decodeIfPresent([OpenRouterModelToolsItem].self, forKey: .tools)
            self.toolIds = try container.decodeIfPresent([String].self, forKey: .toolIds)
            self.knowledgeBase = try container.decodeIfPresent(CreateCustomKnowledgeBaseDto.self, forKey: .knowledgeBase)
            self.model = try container.decode(String.self, forKey: .model)
            self.temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
            self.maxTokens = try container.decodeIfPresent(Double.self, forKey: .maxTokens)
            self.emotionRecognitionEnabled = try container.decodeIfPresent(Bool.self, forKey: .emotionRecognitionEnabled)
            self.numFastTurns = try container.decodeIfPresent(Double.self, forKey: .numFastTurns)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encodeIfPresent(self.tools, forKey: .tools)
            try container.encodeIfPresent(self.toolIds, forKey: .toolIds)
            try container.encodeIfPresent(self.knowledgeBase, forKey: .knowledgeBase)
            try container.encode(self.model, forKey: .model)
            try container.encodeIfPresent(self.temperature, forKey: .temperature)
            try container.encodeIfPresent(self.maxTokens, forKey: .maxTokens)
            try container.encodeIfPresent(self.emotionRecognitionEnabled, forKey: .emotionRecognitionEnabled)
            try container.encodeIfPresent(self.numFastTurns, forKey: .numFastTurns)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case messages
            case tools
            case toolIds
            case knowledgeBase
            case model
            case temperature
            case maxTokens
            case emotionRecognitionEnabled
            case numFastTurns
        }
    }

    public struct PerplexityAi: Codable, Hashable, Sendable {
        public let provider: String = "perplexity-ai"
        /// This is the starting state for the conversation.
        public let messages: [OpenAiMessage]?
        /// These are the tools that the assistant can use during the call. To use existing tools, use `toolIds`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let tools: [PerplexityAiModelToolsItem]?
        /// These are the tools that the assistant can use during the call. To use transient tools, use `tools`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let toolIds: [String]?
        /// These are the options for the knowledge base.
        public let knowledgeBase: CreateCustomKnowledgeBaseDto?
        /// This is the name of the model. Ex. cognitivecomputations/dolphin-mixtral-8x7b
        public let model: String
        /// This is the temperature that will be used for calls. Default is 0 to leverage caching for lower latency.
        public let temperature: Double?
        /// This is the max number of tokens that the assistant will be allowed to generate in each turn of the conversation. Default is 250.
        public let maxTokens: Double?
        /// This determines whether we detect user's emotion while they speak and send it as an additional info to model.
        /// 
        /// Default `false` because the model is usually are good at understanding the user's emotion from text.
        /// 
        /// @default false
        public let emotionRecognitionEnabled: Bool?
        /// This sets how many turns at the start of the conversation to use a smaller, faster model from the same provider before switching to the primary model. Example, gpt-3.5-turbo if provider is openai.
        /// 
        /// Default is 0.
        /// 
        /// @default 0
        public let numFastTurns: Double?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [OpenAiMessage]? = nil,
            tools: [PerplexityAiModelToolsItem]? = nil,
            toolIds: [String]? = nil,
            knowledgeBase: CreateCustomKnowledgeBaseDto? = nil,
            model: String,
            temperature: Double? = nil,
            maxTokens: Double? = nil,
            emotionRecognitionEnabled: Bool? = nil,
            numFastTurns: Double? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.tools = tools
            self.toolIds = toolIds
            self.knowledgeBase = knowledgeBase
            self.model = model
            self.temperature = temperature
            self.maxTokens = maxTokens
            self.emotionRecognitionEnabled = emotionRecognitionEnabled
            self.numFastTurns = numFastTurns
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([OpenAiMessage].self, forKey: .messages)
            self.tools = try container.decodeIfPresent([PerplexityAiModelToolsItem].self, forKey: .tools)
            self.toolIds = try container.decodeIfPresent([String].self, forKey: .toolIds)
            self.knowledgeBase = try container.decodeIfPresent(CreateCustomKnowledgeBaseDto.self, forKey: .knowledgeBase)
            self.model = try container.decode(String.self, forKey: .model)
            self.temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
            self.maxTokens = try container.decodeIfPresent(Double.self, forKey: .maxTokens)
            self.emotionRecognitionEnabled = try container.decodeIfPresent(Bool.self, forKey: .emotionRecognitionEnabled)
            self.numFastTurns = try container.decodeIfPresent(Double.self, forKey: .numFastTurns)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encodeIfPresent(self.tools, forKey: .tools)
            try container.encodeIfPresent(self.toolIds, forKey: .toolIds)
            try container.encodeIfPresent(self.knowledgeBase, forKey: .knowledgeBase)
            try container.encode(self.model, forKey: .model)
            try container.encodeIfPresent(self.temperature, forKey: .temperature)
            try container.encodeIfPresent(self.maxTokens, forKey: .maxTokens)
            try container.encodeIfPresent(self.emotionRecognitionEnabled, forKey: .emotionRecognitionEnabled)
            try container.encodeIfPresent(self.numFastTurns, forKey: .numFastTurns)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case messages
            case tools
            case toolIds
            case knowledgeBase
            case model
            case temperature
            case maxTokens
            case emotionRecognitionEnabled
            case numFastTurns
        }
    }

    public struct TogetherAi: Codable, Hashable, Sendable {
        public let provider: String = "together-ai"
        /// This is the starting state for the conversation.
        public let messages: [OpenAiMessage]?
        /// These are the tools that the assistant can use during the call. To use existing tools, use `toolIds`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let tools: [TogetherAiModelToolsItem]?
        /// These are the tools that the assistant can use during the call. To use transient tools, use `tools`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let toolIds: [String]?
        /// These are the options for the knowledge base.
        public let knowledgeBase: CreateCustomKnowledgeBaseDto?
        /// This is the name of the model. Ex. cognitivecomputations/dolphin-mixtral-8x7b
        public let model: String
        /// This is the temperature that will be used for calls. Default is 0 to leverage caching for lower latency.
        public let temperature: Double?
        /// This is the max number of tokens that the assistant will be allowed to generate in each turn of the conversation. Default is 250.
        public let maxTokens: Double?
        /// This determines whether we detect user's emotion while they speak and send it as an additional info to model.
        /// 
        /// Default `false` because the model is usually are good at understanding the user's emotion from text.
        /// 
        /// @default false
        public let emotionRecognitionEnabled: Bool?
        /// This sets how many turns at the start of the conversation to use a smaller, faster model from the same provider before switching to the primary model. Example, gpt-3.5-turbo if provider is openai.
        /// 
        /// Default is 0.
        /// 
        /// @default 0
        public let numFastTurns: Double?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [OpenAiMessage]? = nil,
            tools: [TogetherAiModelToolsItem]? = nil,
            toolIds: [String]? = nil,
            knowledgeBase: CreateCustomKnowledgeBaseDto? = nil,
            model: String,
            temperature: Double? = nil,
            maxTokens: Double? = nil,
            emotionRecognitionEnabled: Bool? = nil,
            numFastTurns: Double? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.tools = tools
            self.toolIds = toolIds
            self.knowledgeBase = knowledgeBase
            self.model = model
            self.temperature = temperature
            self.maxTokens = maxTokens
            self.emotionRecognitionEnabled = emotionRecognitionEnabled
            self.numFastTurns = numFastTurns
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([OpenAiMessage].self, forKey: .messages)
            self.tools = try container.decodeIfPresent([TogetherAiModelToolsItem].self, forKey: .tools)
            self.toolIds = try container.decodeIfPresent([String].self, forKey: .toolIds)
            self.knowledgeBase = try container.decodeIfPresent(CreateCustomKnowledgeBaseDto.self, forKey: .knowledgeBase)
            self.model = try container.decode(String.self, forKey: .model)
            self.temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
            self.maxTokens = try container.decodeIfPresent(Double.self, forKey: .maxTokens)
            self.emotionRecognitionEnabled = try container.decodeIfPresent(Bool.self, forKey: .emotionRecognitionEnabled)
            self.numFastTurns = try container.decodeIfPresent(Double.self, forKey: .numFastTurns)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encodeIfPresent(self.tools, forKey: .tools)
            try container.encodeIfPresent(self.toolIds, forKey: .toolIds)
            try container.encodeIfPresent(self.knowledgeBase, forKey: .knowledgeBase)
            try container.encode(self.model, forKey: .model)
            try container.encodeIfPresent(self.temperature, forKey: .temperature)
            try container.encodeIfPresent(self.maxTokens, forKey: .maxTokens)
            try container.encodeIfPresent(self.emotionRecognitionEnabled, forKey: .emotionRecognitionEnabled)
            try container.encodeIfPresent(self.numFastTurns, forKey: .numFastTurns)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case messages
            case tools
            case toolIds
            case knowledgeBase
            case model
            case temperature
            case maxTokens
            case emotionRecognitionEnabled
            case numFastTurns
        }
    }

    public struct Xai: Codable, Hashable, Sendable {
        public let provider: String = "xai"
        /// This is the starting state for the conversation.
        public let messages: [OpenAiMessage]?
        /// These are the tools that the assistant can use during the call. To use existing tools, use `toolIds`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let tools: [XaiModelToolsItem]?
        /// These are the tools that the assistant can use during the call. To use transient tools, use `tools`.
        /// 
        /// Both `tools` and `toolIds` can be used together.
        public let toolIds: [String]?
        /// These are the options for the knowledge base.
        public let knowledgeBase: CreateCustomKnowledgeBaseDto?
        /// This is the name of the model. Ex. cognitivecomputations/dolphin-mixtral-8x7b
        public let model: XaiModelModel
        /// This is the temperature that will be used for calls. Default is 0 to leverage caching for lower latency.
        public let temperature: Double?
        /// This is the max number of tokens that the assistant will be allowed to generate in each turn of the conversation. Default is 250.
        public let maxTokens: Double?
        /// This determines whether we detect user's emotion while they speak and send it as an additional info to model.
        /// 
        /// Default `false` because the model is usually are good at understanding the user's emotion from text.
        /// 
        /// @default false
        public let emotionRecognitionEnabled: Bool?
        /// This sets how many turns at the start of the conversation to use a smaller, faster model from the same provider before switching to the primary model. Example, gpt-3.5-turbo if provider is openai.
        /// 
        /// Default is 0.
        /// 
        /// @default 0
        public let numFastTurns: Double?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [OpenAiMessage]? = nil,
            tools: [XaiModelToolsItem]? = nil,
            toolIds: [String]? = nil,
            knowledgeBase: CreateCustomKnowledgeBaseDto? = nil,
            model: XaiModelModel,
            temperature: Double? = nil,
            maxTokens: Double? = nil,
            emotionRecognitionEnabled: Bool? = nil,
            numFastTurns: Double? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.tools = tools
            self.toolIds = toolIds
            self.knowledgeBase = knowledgeBase
            self.model = model
            self.temperature = temperature
            self.maxTokens = maxTokens
            self.emotionRecognitionEnabled = emotionRecognitionEnabled
            self.numFastTurns = numFastTurns
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([OpenAiMessage].self, forKey: .messages)
            self.tools = try container.decodeIfPresent([XaiModelToolsItem].self, forKey: .tools)
            self.toolIds = try container.decodeIfPresent([String].self, forKey: .toolIds)
            self.knowledgeBase = try container.decodeIfPresent(CreateCustomKnowledgeBaseDto.self, forKey: .knowledgeBase)
            self.model = try container.decode(XaiModelModel.self, forKey: .model)
            self.temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
            self.maxTokens = try container.decodeIfPresent(Double.self, forKey: .maxTokens)
            self.emotionRecognitionEnabled = try container.decodeIfPresent(Bool.self, forKey: .emotionRecognitionEnabled)
            self.numFastTurns = try container.decodeIfPresent(Double.self, forKey: .numFastTurns)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encodeIfPresent(self.tools, forKey: .tools)
            try container.encodeIfPresent(self.toolIds, forKey: .toolIds)
            try container.encodeIfPresent(self.knowledgeBase, forKey: .knowledgeBase)
            try container.encode(self.model, forKey: .model)
            try container.encodeIfPresent(self.temperature, forKey: .temperature)
            try container.encodeIfPresent(self.maxTokens, forKey: .maxTokens)
            try container.encodeIfPresent(self.emotionRecognitionEnabled, forKey: .emotionRecognitionEnabled)
            try container.encodeIfPresent(self.numFastTurns, forKey: .numFastTurns)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case messages
            case tools
            case toolIds
            case knowledgeBase
            case model
            case temperature
            case maxTokens
            case emotionRecognitionEnabled
            case numFastTurns
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
    }
}