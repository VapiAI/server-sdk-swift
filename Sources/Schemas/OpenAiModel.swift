import Foundation

public struct OpenAiModel: Codable, Hashable, Sendable {
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