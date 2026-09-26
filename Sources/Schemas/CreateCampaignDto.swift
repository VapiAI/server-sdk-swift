import Foundation

/// Configuration used to create an outbound calling campaign. Choose an assistant, squad, or workflow, then provide customers, phone-number or dial-plan settings, and an optional schedule.
public struct CreateCampaignDto: Codable, Hashable, Sendable {
    /// This is the name of the campaign. This is just for your own reference.
    public let name: String
    /// This is the assistant ID that will be used for the campaign calls. Note: Only one of assistantId, workflowId, or squadId can be used.
    public let assistantId: String?
    /// This is the workflow ID that will be used for the campaign calls. Note: Only one of assistantId, workflowId, or squadId can be used.
    public let workflowId: String?
    /// This is the squad ID that will be used for the campaign calls. Note: Only one of assistantId, workflowId, or squadId can be used.
    public let squadId: String?
    /// This is the phone number ID that will be used for the campaign calls. Required if dialPlan is not provided. Note: phoneNumberId and dialPlan are mutually exclusive.
    public let phoneNumberId: String?
    /// This is a list of dial entries, each specifying a phone number and the customers to call using that number. Use this when you want different phone numbers to call different sets of customers. Note: phoneNumberId and dialPlan are mutually exclusive.
    public let dialPlan: [DialPlanEntry]?
    /// This is the schedule plan for the campaign. Calls will start at startedAt and continue until your organization’s concurrency limit is reached. Any remaining calls will be retried for up to one hour as capacity becomes available. After that hour or after latestAt, whichever comes first, any calls that couldn’t be placed won’t be retried.
    public let schedulePlan: SchedulePlan?
    /// These are the customers that will be called in the campaign. Required if dialPlan is not provided. Maximum of 10000 customers per campaign.
    public let customers: [CreateCustomerDto]?
    /// This is the maximum number of concurrent calls that will be made for the campaign. Defaults to 10. Maximum of 500, and may not exceed your organization's concurrency limit.
    public let maxConcurrency: Double?
    /// These are the overrides for the assistant's settings and template variables for the campaign. Use this when the campaign targets an `assistantId`.
    public let assistantOverrides: AssistantOverrides?
    /// These are the overrides for the squad and template variables for the campaign. Use this when the campaign targets a `squadId`. Per-contact `squadOverrides` are deep-merged on top of this at dispatch time.
    public let squadOverrides: AssistantOverrides?
    /// This is the server (URL, auth headers, timeout, etc.) for the campaign webhooks.
    public let server: Server?
    /// These are the messages that will be sent to your Server URL.
    public let serverMessages: [CreateCampaignDtoServerMessagesItem]?
    /// This opts the campaign into the blocking `campaign.predial` eligibility webhook. When set, every contact triggers a `campaign.predial` POST to the Server URL before dialing, and the response `{ eligible: boolean }` decides whether the call is placed. Requires `server`. When unset, no pre-dial webhook is sent.
    public let predialPlan: CampaignPredialPlan?
    /// Optional campaign ID to duplicate config from. Provided fields in the request override the source. If `customers` is omitted, contacts are copied from the source.
    public let duplicateFromCampaignId: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        assistantId: String? = nil,
        workflowId: String? = nil,
        squadId: String? = nil,
        phoneNumberId: String? = nil,
        dialPlan: [DialPlanEntry]? = nil,
        schedulePlan: SchedulePlan? = nil,
        customers: [CreateCustomerDto]? = nil,
        maxConcurrency: Double? = nil,
        assistantOverrides: AssistantOverrides? = nil,
        squadOverrides: AssistantOverrides? = nil,
        server: Server? = nil,
        serverMessages: [CreateCampaignDtoServerMessagesItem]? = nil,
        predialPlan: CampaignPredialPlan? = nil,
        duplicateFromCampaignId: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.assistantId = assistantId
        self.workflowId = workflowId
        self.squadId = squadId
        self.phoneNumberId = phoneNumberId
        self.dialPlan = dialPlan
        self.schedulePlan = schedulePlan
        self.customers = customers
        self.maxConcurrency = maxConcurrency
        self.assistantOverrides = assistantOverrides
        self.squadOverrides = squadOverrides
        self.server = server
        self.serverMessages = serverMessages
        self.predialPlan = predialPlan
        self.duplicateFromCampaignId = duplicateFromCampaignId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
        self.workflowId = try container.decodeIfPresent(String.self, forKey: .workflowId)
        self.squadId = try container.decodeIfPresent(String.self, forKey: .squadId)
        self.phoneNumberId = try container.decodeIfPresent(String.self, forKey: .phoneNumberId)
        self.dialPlan = try container.decodeIfPresent([DialPlanEntry].self, forKey: .dialPlan)
        self.schedulePlan = try container.decodeIfPresent(SchedulePlan.self, forKey: .schedulePlan)
        self.customers = try container.decodeIfPresent([CreateCustomerDto].self, forKey: .customers)
        self.maxConcurrency = try container.decodeIfPresent(Double.self, forKey: .maxConcurrency)
        self.assistantOverrides = try container.decodeIfPresent(AssistantOverrides.self, forKey: .assistantOverrides)
        self.squadOverrides = try container.decodeIfPresent(AssistantOverrides.self, forKey: .squadOverrides)
        self.server = try container.decodeIfPresent(Server.self, forKey: .server)
        self.serverMessages = try container.decodeIfPresent([CreateCampaignDtoServerMessagesItem].self, forKey: .serverMessages)
        self.predialPlan = try container.decodeIfPresent(CampaignPredialPlan.self, forKey: .predialPlan)
        self.duplicateFromCampaignId = try container.decodeIfPresent(String.self, forKey: .duplicateFromCampaignId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
        try container.encodeIfPresent(self.workflowId, forKey: .workflowId)
        try container.encodeIfPresent(self.squadId, forKey: .squadId)
        try container.encodeIfPresent(self.phoneNumberId, forKey: .phoneNumberId)
        try container.encodeIfPresent(self.dialPlan, forKey: .dialPlan)
        try container.encodeIfPresent(self.schedulePlan, forKey: .schedulePlan)
        try container.encodeIfPresent(self.customers, forKey: .customers)
        try container.encodeIfPresent(self.maxConcurrency, forKey: .maxConcurrency)
        try container.encodeIfPresent(self.assistantOverrides, forKey: .assistantOverrides)
        try container.encodeIfPresent(self.squadOverrides, forKey: .squadOverrides)
        try container.encodeIfPresent(self.server, forKey: .server)
        try container.encodeIfPresent(self.serverMessages, forKey: .serverMessages)
        try container.encodeIfPresent(self.predialPlan, forKey: .predialPlan)
        try container.encodeIfPresent(self.duplicateFromCampaignId, forKey: .duplicateFromCampaignId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case assistantId
        case workflowId
        case squadId
        case phoneNumberId
        case dialPlan
        case schedulePlan
        case customers
        case maxConcurrency
        case assistantOverrides
        case squadOverrides
        case server
        case serverMessages
        case predialPlan
        case duplicateFromCampaignId
    }
}