import Foundation

public struct CreateWebCallDto: Codable, Hashable, Sendable {
    /// This is the assistant ID that will be used for the call. To use a transient assistant, use `assistant` instead.
    /// 
    /// To start a call with:
    /// - Assistant, use `assistantId` or `assistant`
    /// - Squad, use `squadId` or `squad`
    /// - Workflow, use `workflowId` or `workflow`
    public let assistantId: String?
    /// This is the assistant that will be used for the call. To use an existing assistant, use `assistantId` instead.
    /// 
    /// To start a call with:
    /// - Assistant, use `assistant`
    /// - Squad, use `squad`
    /// - Workflow, use `workflow`
    public let assistant: CreateAssistantDto?
    /// These are the overrides for the `assistant` or `assistantId`'s settings and template variables.
    public let assistantOverrides: AssistantOverrides?
    /// This is the squad that will be used for the call. To use a transient squad, use `squad` instead.
    /// 
    /// To start a call with:
    /// - Assistant, use `assistant` or `assistantId`
    /// - Squad, use `squad` or `squadId`
    /// - Workflow, use `workflow` or `workflowId`
    public let squadId: String?
    /// This is a squad that will be used for the call. To use an existing squad, use `squadId` instead.
    /// 
    /// To start a call with:
    /// - Assistant, use `assistant` or `assistantId`
    /// - Squad, use `squad` or `squadId`
    /// - Workflow, use `workflow` or `workflowId`
    public let squad: CreateSquadDto?
    /// This is the workflow that will be used for the call. To use a transient workflow, use `workflow` instead.
    /// 
    /// To start a call with:
    /// - Assistant, use `assistant` or `assistantId`
    /// - Squad, use `squad` or `squadId`
    /// - Workflow, use `workflow` or `workflowId`
    public let workflowId: String?
    /// This is a workflow that will be used for the call. To use an existing workflow, use `workflowId` instead.
    /// 
    /// To start a call with:
    /// - Assistant, use `assistant` or `assistantId`
    /// - Squad, use `squad` or `squadId`
    /// - Workflow, use `workflow` or `workflowId`
    public let workflow: CreateWorkflowDto?
    /// These are the overrides for the `workflow` or `workflowId`'s settings and template variables.
    public let workflowOverrides: WorkflowOverrides?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        assistantId: String? = nil,
        assistant: CreateAssistantDto? = nil,
        assistantOverrides: AssistantOverrides? = nil,
        squadId: String? = nil,
        squad: CreateSquadDto? = nil,
        workflowId: String? = nil,
        workflow: CreateWorkflowDto? = nil,
        workflowOverrides: WorkflowOverrides? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.assistantId = assistantId
        self.assistant = assistant
        self.assistantOverrides = assistantOverrides
        self.squadId = squadId
        self.squad = squad
        self.workflowId = workflowId
        self.workflow = workflow
        self.workflowOverrides = workflowOverrides
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
        self.assistant = try container.decodeIfPresent(CreateAssistantDto.self, forKey: .assistant)
        self.assistantOverrides = try container.decodeIfPresent(AssistantOverrides.self, forKey: .assistantOverrides)
        self.squadId = try container.decodeIfPresent(String.self, forKey: .squadId)
        self.squad = try container.decodeIfPresent(CreateSquadDto.self, forKey: .squad)
        self.workflowId = try container.decodeIfPresent(String.self, forKey: .workflowId)
        self.workflow = try container.decodeIfPresent(CreateWorkflowDto.self, forKey: .workflow)
        self.workflowOverrides = try container.decodeIfPresent(WorkflowOverrides.self, forKey: .workflowOverrides)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
        try container.encodeIfPresent(self.assistant, forKey: .assistant)
        try container.encodeIfPresent(self.assistantOverrides, forKey: .assistantOverrides)
        try container.encodeIfPresent(self.squadId, forKey: .squadId)
        try container.encodeIfPresent(self.squad, forKey: .squad)
        try container.encodeIfPresent(self.workflowId, forKey: .workflowId)
        try container.encodeIfPresent(self.workflow, forKey: .workflow)
        try container.encodeIfPresent(self.workflowOverrides, forKey: .workflowOverrides)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case assistantId
        case assistant
        case assistantOverrides
        case squadId
        case squad
        case workflowId
        case workflow
        case workflowOverrides
    }
}