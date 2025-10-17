import Foundation

public struct PerplexityAiModel: Codable, Hashable, Sendable {
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