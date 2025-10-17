import Foundation

public struct ConversationNode: Codable, Hashable, Sendable {
    /// This is the model for the node.
    /// 
    /// This overrides `workflow.model`.
    public let model: ConversationNodeModel?
    /// This is the transcriber for the node.
    /// 
    /// This overrides `workflow.transcriber`.
    public let transcriber: ConversationNodeTranscriber?
    /// This is the voice for the node.
    /// 
    /// This overrides `workflow.voice`.
    public let voice: ConversationNodeVoice?
    /// These are the tools that the conversation node can use during the call. To use existing tools, use `toolIds`.
    /// 
    /// Both `tools` and `toolIds` can be used together.
    public let tools: [ConversationNodeToolsItem]?
    /// These are the tools that the conversation node can use during the call. To use transient tools, use `tools`.
    /// 
    /// Both `tools` and `toolIds` can be used together.
    public let toolIds: [String]?
    public let prompt: String?
    /// This is the plan for the global node.
    public let globalNodePlan: GlobalNodePlan?
    /// This is the plan that controls the variable extraction from the user's responses.
    /// 
    /// Usage:
    /// Use `schema` to specify what you want to extract from the user's responses.
    /// ```json
    /// {
    ///   "schema": {
    ///     "type": "object",
    ///     "properties": {
    ///       "user": {
    ///         "type": "object",
    ///         "properties": {
    ///           "name": {
    ///             "type": "string"
    ///           },
    ///           "age": {
    ///             "type": "number"
    ///           }
    ///         }
    ///       }
    ///     }
    ///   }
    /// }
    /// ```
    /// 
    /// This will be extracted as `{{ user.name }}` and `{{ user.age }}` respectively.
    /// 
    /// (Optional) Use `aliases` to create new variables.
    /// 
    /// ```json
    /// {
    ///   "aliases": [
    ///     {
    ///       "key": "userAge",
    ///       "value": "{{user.age}}"
    ///     },
    ///     {
    ///       "key": "userName",
    ///       "value": "{{user.name}}"
    ///     }
    ///   ]
    /// }
    /// ```
    /// 
    /// This will be extracted as `{{ userAge }}` and `{{ userName }}` respectively.
    /// 
    /// Note: The `schema` field is required for Conversation nodes if you want to extract variables from the user's responses. `aliases` is just a convenience.
    public let variableExtractionPlan: VariableExtractionPlan?
    public let name: String
    /// This is whether or not the node is the start of the workflow.
    public let isStart: Bool?
    /// This is for metadata you want to store on the task.
    public let metadata: [String: JSONValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        model: ConversationNodeModel? = nil,
        transcriber: ConversationNodeTranscriber? = nil,
        voice: ConversationNodeVoice? = nil,
        tools: [ConversationNodeToolsItem]? = nil,
        toolIds: [String]? = nil,
        prompt: String? = nil,
        globalNodePlan: GlobalNodePlan? = nil,
        variableExtractionPlan: VariableExtractionPlan? = nil,
        name: String,
        isStart: Bool? = nil,
        metadata: [String: JSONValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.model = model
        self.transcriber = transcriber
        self.voice = voice
        self.tools = tools
        self.toolIds = toolIds
        self.prompt = prompt
        self.globalNodePlan = globalNodePlan
        self.variableExtractionPlan = variableExtractionPlan
        self.name = name
        self.isStart = isStart
        self.metadata = metadata
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.model = try container.decodeIfPresent(ConversationNodeModel.self, forKey: .model)
        self.transcriber = try container.decodeIfPresent(ConversationNodeTranscriber.self, forKey: .transcriber)
        self.voice = try container.decodeIfPresent(ConversationNodeVoice.self, forKey: .voice)
        self.tools = try container.decodeIfPresent([ConversationNodeToolsItem].self, forKey: .tools)
        self.toolIds = try container.decodeIfPresent([String].self, forKey: .toolIds)
        self.prompt = try container.decodeIfPresent(String.self, forKey: .prompt)
        self.globalNodePlan = try container.decodeIfPresent(GlobalNodePlan.self, forKey: .globalNodePlan)
        self.variableExtractionPlan = try container.decodeIfPresent(VariableExtractionPlan.self, forKey: .variableExtractionPlan)
        self.name = try container.decode(String.self, forKey: .name)
        self.isStart = try container.decodeIfPresent(Bool.self, forKey: .isStart)
        self.metadata = try container.decodeIfPresent([String: JSONValue].self, forKey: .metadata)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encodeIfPresent(self.transcriber, forKey: .transcriber)
        try container.encodeIfPresent(self.voice, forKey: .voice)
        try container.encodeIfPresent(self.tools, forKey: .tools)
        try container.encodeIfPresent(self.toolIds, forKey: .toolIds)
        try container.encodeIfPresent(self.prompt, forKey: .prompt)
        try container.encodeIfPresent(self.globalNodePlan, forKey: .globalNodePlan)
        try container.encodeIfPresent(self.variableExtractionPlan, forKey: .variableExtractionPlan)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.isStart, forKey: .isStart)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case model
        case transcriber
        case voice
        case tools
        case toolIds
        case prompt
        case globalNodePlan
        case variableExtractionPlan
        case name
        case isStart
        case metadata
    }
}