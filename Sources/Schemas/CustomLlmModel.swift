import Foundation

public struct CustomLlmModel: Codable, Hashable, Sendable {
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