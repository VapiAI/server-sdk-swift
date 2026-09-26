import Foundation

public struct VapiModel: Codable, Hashable, Sendable {
    /// This is the starting state for the conversation.
    public let messages: [OpenAiMessage]?
    /// These are the tools that the assistant can use during the call. To use existing tools, use `toolIds`.
    /// 
    /// Both `tools` and `toolIds` can be used together.
    public let tools: [VapiModelToolsItem]?
    /// These are the tools that the assistant can use during the call. To use transient tools, use `tools`.
    /// 
    /// Both `tools` and `toolIds` can be used together.
    public let toolIds: [String]?
    /// These are version-pinned references to tools. Each entry pins a specific
    /// version of a tool by `(toolId, version)`. When the same `toolId` appears
    /// in both `toolIds` and `toolRefs[]`, the `toolRefs` pin wins (the
    /// `toolIds` entry is dropped at write time).
    public let toolRefs: [ToolRef]?
    /// These are the options for the knowledge base.
    public let knowledgeBase: CreateCustomKnowledgeBaseDto?
    /// White-label Vapi models are selected by `version`, not a model name, so
    /// `model` is optional here (the runtime already accepts a version-only Vapi
    /// payload). Overriding the required `ModelBase.model`: the declared type stays
    /// `string` to match the base (avoids TS2416) and the `= undefined!` initializer
    /// satisfies TS2612 for the field override, while `@IsOptional` +
    /// `@ApiPropertyOptional` make validation and the generated OpenAPI schema treat
    /// it as optional (so `VapiModel.required` is `['provider']`).
    public let model: String?
    /// Vapi-managed model version (update channel). When set, this is a Vapi-managed
    /// LLM routed by the registry; when absent, this is the legacy workflow form
    /// below (`steps` / `workflow`).
    public let version: VapiModelVersion?
    /// This is the workflow that will be used for the call. To use a transient workflow, use `workflow` instead.
    public let workflowId: String?
    /// This is the workflow that will be used for the call. To use an existing workflow, use `workflowId` instead.
    public let workflow: WorkflowUserEditable?
    /// This is the temperature that will be used for calls. Default is 0.5.
    public let temperature: Double?
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
        tools: [VapiModelToolsItem]? = nil,
        toolIds: [String]? = nil,
        toolRefs: [ToolRef]? = nil,
        knowledgeBase: CreateCustomKnowledgeBaseDto? = nil,
        model: String? = nil,
        version: VapiModelVersion? = nil,
        workflowId: String? = nil,
        workflow: WorkflowUserEditable? = nil,
        temperature: Double? = nil,
        emotionRecognitionEnabled: Bool? = nil,
        numFastTurns: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.messages = messages
        self.tools = tools
        self.toolIds = toolIds
        self.toolRefs = toolRefs
        self.knowledgeBase = knowledgeBase
        self.model = model
        self.version = version
        self.workflowId = workflowId
        self.workflow = workflow
        self.temperature = temperature
        self.emotionRecognitionEnabled = emotionRecognitionEnabled
        self.numFastTurns = numFastTurns
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.messages = try container.decodeIfPresent([OpenAiMessage].self, forKey: .messages)
        self.tools = try container.decodeIfPresent([VapiModelToolsItem].self, forKey: .tools)
        self.toolIds = try container.decodeIfPresent([String].self, forKey: .toolIds)
        self.toolRefs = try container.decodeIfPresent([ToolRef].self, forKey: .toolRefs)
        self.knowledgeBase = try container.decodeIfPresent(CreateCustomKnowledgeBaseDto.self, forKey: .knowledgeBase)
        self.model = try container.decodeIfPresent(String.self, forKey: .model)
        self.version = try container.decodeIfPresent(VapiModelVersion.self, forKey: .version)
        self.workflowId = try container.decodeIfPresent(String.self, forKey: .workflowId)
        self.workflow = try container.decodeIfPresent(WorkflowUserEditable.self, forKey: .workflow)
        self.temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
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
        try container.encodeIfPresent(self.toolRefs, forKey: .toolRefs)
        try container.encodeIfPresent(self.knowledgeBase, forKey: .knowledgeBase)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encodeIfPresent(self.version, forKey: .version)
        try container.encodeIfPresent(self.workflowId, forKey: .workflowId)
        try container.encodeIfPresent(self.workflow, forKey: .workflow)
        try container.encodeIfPresent(self.temperature, forKey: .temperature)
        try container.encodeIfPresent(self.emotionRecognitionEnabled, forKey: .emotionRecognitionEnabled)
        try container.encodeIfPresent(self.numFastTurns, forKey: .numFastTurns)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case messages
        case tools
        case toolIds
        case toolRefs
        case knowledgeBase
        case model
        case version
        case workflowId
        case workflow
        case temperature
        case emotionRecognitionEnabled
        case numFastTurns
    }
}