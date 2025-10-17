import Foundation

public struct Call: Codable, Hashable, Sendable {
    /// This is the type of call.
    public let type: CallType?
    /// These are the costs of individual components of the call in USD.
    public let costs: [CallCostsItem]?
    public let messages: [CallMessagesItem]?
    /// This is the provider of the call.
    /// 
    /// Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
    public let phoneCallProvider: CallPhoneCallProvider?
    /// This is the transport of the phone call.
    /// 
    /// Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
    public let phoneCallTransport: CallPhoneCallTransport?
    /// This is the status of the call.
    public let status: CallStatus?
    /// This is the explanation for how the call ended.
    public let endedReason: CallEndedReason?
    /// This is the destination where the call ended up being transferred to. If the call was not transferred, this will be empty.
    public let destination: CallDestination?
    /// This is the unique identifier for the call.
    public let id: String
    /// This is the unique identifier for the org that this call belongs to.
    public let orgId: String
    /// This is the ISO 8601 date-time string of when the call was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the call was last updated.
    public let updatedAt: Date
    /// This is the ISO 8601 date-time string of when the call was started.
    public let startedAt: Date?
    /// This is the ISO 8601 date-time string of when the call was ended.
    public let endedAt: Date?
    /// This is the cost of the call in USD.
    public let cost: Double?
    /// This is the cost of the call in USD.
    public let costBreakdown: CostBreakdown?
    /// This is a copy of assistant artifact plan. This isn't actually stored on the call but rather just returned in POST /call/web to enable artifact creation client side.
    public let artifactPlan: ArtifactPlan?
    /// This is the analysis of the call. Configure in `assistant.analysisPlan`.
    public let analysis: Analysis?
    /// This is to real-time monitor the call. Configure in `assistant.monitorPlan`.
    public let monitor: Monitor?
    /// These are the artifacts created from the call. Configure in `assistant.artifactPlan`.
    public let artifact: Artifact?
    /// This is the compliance of the call. Configure in `assistant.compliancePlan`.
    public let compliance: Compliance?
    /// The ID of the call as provided by the phone number service. callSid in Twilio. conversationUuid in Vonage. callControlId in Telnyx.
    /// 
    /// Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
    public let phoneCallProviderId: String?
    /// This is the campaign ID that the call belongs to.
    public let campaignId: String?
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
    /// This is the phone number that will be used for the call. To use a transient number, use `phoneNumber` instead.
    /// 
    /// Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
    public let phoneNumberId: String?
    /// This is the phone number that will be used for the call. To use an existing number, use `phoneNumberId` instead.
    /// 
    /// Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
    public let phoneNumber: ImportTwilioPhoneNumberDto?
    /// This is the customer that will be called. To call a transient customer , use `customer` instead.
    /// 
    /// Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
    public let customerId: String?
    /// This is the customer that will be called. To call an existing customer, use `customerId` instead.
    /// 
    /// Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
    public let customer: CreateCustomerDto?
    /// This is the name of the call. This is just for your own reference.
    public let name: String?
    /// This is the schedule plan of the call.
    public let schedulePlan: SchedulePlan?
    /// This is the transport of the call.
    public let transport: [String: JSONValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: CallType? = nil,
        costs: [CallCostsItem]? = nil,
        messages: [CallMessagesItem]? = nil,
        phoneCallProvider: CallPhoneCallProvider? = nil,
        phoneCallTransport: CallPhoneCallTransport? = nil,
        status: CallStatus? = nil,
        endedReason: CallEndedReason? = nil,
        destination: CallDestination? = nil,
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        startedAt: Date? = nil,
        endedAt: Date? = nil,
        cost: Double? = nil,
        costBreakdown: CostBreakdown? = nil,
        artifactPlan: ArtifactPlan? = nil,
        analysis: Analysis? = nil,
        monitor: Monitor? = nil,
        artifact: Artifact? = nil,
        compliance: Compliance? = nil,
        phoneCallProviderId: String? = nil,
        campaignId: String? = nil,
        assistantId: String? = nil,
        assistant: CreateAssistantDto? = nil,
        assistantOverrides: AssistantOverrides? = nil,
        squadId: String? = nil,
        squad: CreateSquadDto? = nil,
        workflowId: String? = nil,
        workflow: CreateWorkflowDto? = nil,
        workflowOverrides: WorkflowOverrides? = nil,
        phoneNumberId: String? = nil,
        phoneNumber: ImportTwilioPhoneNumberDto? = nil,
        customerId: String? = nil,
        customer: CreateCustomerDto? = nil,
        name: String? = nil,
        schedulePlan: SchedulePlan? = nil,
        transport: [String: JSONValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.costs = costs
        self.messages = messages
        self.phoneCallProvider = phoneCallProvider
        self.phoneCallTransport = phoneCallTransport
        self.status = status
        self.endedReason = endedReason
        self.destination = destination
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.startedAt = startedAt
        self.endedAt = endedAt
        self.cost = cost
        self.costBreakdown = costBreakdown
        self.artifactPlan = artifactPlan
        self.analysis = analysis
        self.monitor = monitor
        self.artifact = artifact
        self.compliance = compliance
        self.phoneCallProviderId = phoneCallProviderId
        self.campaignId = campaignId
        self.assistantId = assistantId
        self.assistant = assistant
        self.assistantOverrides = assistantOverrides
        self.squadId = squadId
        self.squad = squad
        self.workflowId = workflowId
        self.workflow = workflow
        self.workflowOverrides = workflowOverrides
        self.phoneNumberId = phoneNumberId
        self.phoneNumber = phoneNumber
        self.customerId = customerId
        self.customer = customer
        self.name = name
        self.schedulePlan = schedulePlan
        self.transport = transport
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decodeIfPresent(CallType.self, forKey: .type)
        self.costs = try container.decodeIfPresent([CallCostsItem].self, forKey: .costs)
        self.messages = try container.decodeIfPresent([CallMessagesItem].self, forKey: .messages)
        self.phoneCallProvider = try container.decodeIfPresent(CallPhoneCallProvider.self, forKey: .phoneCallProvider)
        self.phoneCallTransport = try container.decodeIfPresent(CallPhoneCallTransport.self, forKey: .phoneCallTransport)
        self.status = try container.decodeIfPresent(CallStatus.self, forKey: .status)
        self.endedReason = try container.decodeIfPresent(CallEndedReason.self, forKey: .endedReason)
        self.destination = try container.decodeIfPresent(CallDestination.self, forKey: .destination)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.startedAt = try container.decodeIfPresent(Date.self, forKey: .startedAt)
        self.endedAt = try container.decodeIfPresent(Date.self, forKey: .endedAt)
        self.cost = try container.decodeIfPresent(Double.self, forKey: .cost)
        self.costBreakdown = try container.decodeIfPresent(CostBreakdown.self, forKey: .costBreakdown)
        self.artifactPlan = try container.decodeIfPresent(ArtifactPlan.self, forKey: .artifactPlan)
        self.analysis = try container.decodeIfPresent(Analysis.self, forKey: .analysis)
        self.monitor = try container.decodeIfPresent(Monitor.self, forKey: .monitor)
        self.artifact = try container.decodeIfPresent(Artifact.self, forKey: .artifact)
        self.compliance = try container.decodeIfPresent(Compliance.self, forKey: .compliance)
        self.phoneCallProviderId = try container.decodeIfPresent(String.self, forKey: .phoneCallProviderId)
        self.campaignId = try container.decodeIfPresent(String.self, forKey: .campaignId)
        self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
        self.assistant = try container.decodeIfPresent(CreateAssistantDto.self, forKey: .assistant)
        self.assistantOverrides = try container.decodeIfPresent(AssistantOverrides.self, forKey: .assistantOverrides)
        self.squadId = try container.decodeIfPresent(String.self, forKey: .squadId)
        self.squad = try container.decodeIfPresent(CreateSquadDto.self, forKey: .squad)
        self.workflowId = try container.decodeIfPresent(String.self, forKey: .workflowId)
        self.workflow = try container.decodeIfPresent(CreateWorkflowDto.self, forKey: .workflow)
        self.workflowOverrides = try container.decodeIfPresent(WorkflowOverrides.self, forKey: .workflowOverrides)
        self.phoneNumberId = try container.decodeIfPresent(String.self, forKey: .phoneNumberId)
        self.phoneNumber = try container.decodeIfPresent(ImportTwilioPhoneNumberDto.self, forKey: .phoneNumber)
        self.customerId = try container.decodeIfPresent(String.self, forKey: .customerId)
        self.customer = try container.decodeIfPresent(CreateCustomerDto.self, forKey: .customer)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.schedulePlan = try container.decodeIfPresent(SchedulePlan.self, forKey: .schedulePlan)
        self.transport = try container.decodeIfPresent([String: JSONValue].self, forKey: .transport)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.costs, forKey: .costs)
        try container.encodeIfPresent(self.messages, forKey: .messages)
        try container.encodeIfPresent(self.phoneCallProvider, forKey: .phoneCallProvider)
        try container.encodeIfPresent(self.phoneCallTransport, forKey: .phoneCallTransport)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.endedReason, forKey: .endedReason)
        try container.encodeIfPresent(self.destination, forKey: .destination)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(self.startedAt, forKey: .startedAt)
        try container.encodeIfPresent(self.endedAt, forKey: .endedAt)
        try container.encodeIfPresent(self.cost, forKey: .cost)
        try container.encodeIfPresent(self.costBreakdown, forKey: .costBreakdown)
        try container.encodeIfPresent(self.artifactPlan, forKey: .artifactPlan)
        try container.encodeIfPresent(self.analysis, forKey: .analysis)
        try container.encodeIfPresent(self.monitor, forKey: .monitor)
        try container.encodeIfPresent(self.artifact, forKey: .artifact)
        try container.encodeIfPresent(self.compliance, forKey: .compliance)
        try container.encodeIfPresent(self.phoneCallProviderId, forKey: .phoneCallProviderId)
        try container.encodeIfPresent(self.campaignId, forKey: .campaignId)
        try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
        try container.encodeIfPresent(self.assistant, forKey: .assistant)
        try container.encodeIfPresent(self.assistantOverrides, forKey: .assistantOverrides)
        try container.encodeIfPresent(self.squadId, forKey: .squadId)
        try container.encodeIfPresent(self.squad, forKey: .squad)
        try container.encodeIfPresent(self.workflowId, forKey: .workflowId)
        try container.encodeIfPresent(self.workflow, forKey: .workflow)
        try container.encodeIfPresent(self.workflowOverrides, forKey: .workflowOverrides)
        try container.encodeIfPresent(self.phoneNumberId, forKey: .phoneNumberId)
        try container.encodeIfPresent(self.phoneNumber, forKey: .phoneNumber)
        try container.encodeIfPresent(self.customerId, forKey: .customerId)
        try container.encodeIfPresent(self.customer, forKey: .customer)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.schedulePlan, forKey: .schedulePlan)
        try container.encodeIfPresent(self.transport, forKey: .transport)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case costs
        case messages
        case phoneCallProvider
        case phoneCallTransport
        case status
        case endedReason
        case destination
        case id
        case orgId
        case createdAt
        case updatedAt
        case startedAt
        case endedAt
        case cost
        case costBreakdown
        case artifactPlan
        case analysis
        case monitor
        case artifact
        case compliance
        case phoneCallProviderId
        case campaignId
        case assistantId
        case assistant
        case assistantOverrides
        case squadId
        case squad
        case workflowId
        case workflow
        case workflowOverrides
        case phoneNumberId
        case phoneNumber
        case customerId
        case customer
        case name
        case schedulePlan
        case transport
    }
}