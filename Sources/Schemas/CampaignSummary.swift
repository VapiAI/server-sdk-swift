import Foundation

public struct CampaignSummary: Codable, Hashable, Sendable {
    /// This is the status of the campaign.
    public let status: CampaignSummaryStatus
    /// This is the explanation for how the campaign ended.
    public let endedReason: CampaignSummaryEndedReason?
    /// This is the name of the campaign. This is just for your own reference.
    public let name: String
    /// This is the assistant ID that will be used for the campaign calls. Note: Only one of assistantId, workflowId, or squadId can be used.
    public let assistantId: String?
    /// This is the squad ID that will be used for the campaign calls. Note: Only one of assistantId, workflowId, or squadId can be used.
    public let squadId: String?
    /// This is the phone number ID that will be used for the campaign calls. Required if dialPlan is not provided. Note: phoneNumberId and dialPlan are mutually exclusive.
    public let phoneNumberId: String?
    /// This is the schedule plan for the campaign. Calls will start at startedAt and continue until your organization’s concurrency limit is reached. Any remaining calls will be retried for up to one hour as capacity becomes available. After that hour or after latestAt, whichever comes first, any calls that couldn’t be placed won’t be retried.
    public let schedulePlan: SchedulePlan?
    /// This is the maximum number of concurrent calls that will be made for the campaign. Defaults to 10. Maximum of 500, and may not exceed your organization's concurrency limit.
    public let maxConcurrency: Double?
    /// These are the overrides for the assistant's settings and template variables for the campaign. Use this when the campaign targets an `assistantId`.
    public let assistantOverrides: AssistantOverrides?
    /// These are the overrides for the squad and template variables for the campaign. Use this when the campaign targets a `squadId`. Per-contact `squadOverrides` are deep-merged on top of this at dispatch time.
    public let squadOverrides: AssistantOverrides?
    /// This is the server (URL, auth headers, timeout, etc.) for the campaign webhooks.
    public let server: Server?
    /// These are the messages that will be sent to your Server URL.
    public let serverMessages: [CampaignSummaryServerMessagesItem]?
    /// This opts the campaign into the blocking `campaign.predial` eligibility webhook. When set, every contact triggers a `campaign.predial` POST to the Server URL before dialing, and the response `{ eligible: boolean }` decides whether the call is placed. Requires `server`. When unset, no pre-dial webhook is sent.
    public let predialPlan: CampaignPredialPlan?
    /// These are the per-status contact counts for this campaign. Sum them for the
    /// campaign's total audience; `pending` plus `dispatched` is what is left to
    /// complete.
    public let contactCounters: CampaignContactCounters?
    /// These are the call-level outcomes for this campaign — how many contacts
    /// were actually dialed, and how many of those a human picked up.
    public let callMetrics: CampaignCallMetrics?
    /// This is the unique identifier for the campaign.
    public let id: String
    /// This is the unique identifier for the org that this campaign belongs to.
    public let orgId: String
    /// This is the ISO 8601 date-time string of when the campaign was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the campaign was last updated.
    public let updatedAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        status: CampaignSummaryStatus,
        endedReason: CampaignSummaryEndedReason? = nil,
        name: String,
        assistantId: String? = nil,
        squadId: String? = nil,
        phoneNumberId: String? = nil,
        schedulePlan: SchedulePlan? = nil,
        maxConcurrency: Double? = nil,
        assistantOverrides: AssistantOverrides? = nil,
        squadOverrides: AssistantOverrides? = nil,
        server: Server? = nil,
        serverMessages: [CampaignSummaryServerMessagesItem]? = nil,
        predialPlan: CampaignPredialPlan? = nil,
        contactCounters: CampaignContactCounters? = nil,
        callMetrics: CampaignCallMetrics? = nil,
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.status = status
        self.endedReason = endedReason
        self.name = name
        self.assistantId = assistantId
        self.squadId = squadId
        self.phoneNumberId = phoneNumberId
        self.schedulePlan = schedulePlan
        self.maxConcurrency = maxConcurrency
        self.assistantOverrides = assistantOverrides
        self.squadOverrides = squadOverrides
        self.server = server
        self.serverMessages = serverMessages
        self.predialPlan = predialPlan
        self.contactCounters = contactCounters
        self.callMetrics = callMetrics
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(CampaignSummaryStatus.self, forKey: .status)
        self.endedReason = try container.decodeIfPresent(CampaignSummaryEndedReason.self, forKey: .endedReason)
        self.name = try container.decode(String.self, forKey: .name)
        self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
        self.squadId = try container.decodeIfPresent(String.self, forKey: .squadId)
        self.phoneNumberId = try container.decodeIfPresent(String.self, forKey: .phoneNumberId)
        self.schedulePlan = try container.decodeIfPresent(SchedulePlan.self, forKey: .schedulePlan)
        self.maxConcurrency = try container.decodeIfPresent(Double.self, forKey: .maxConcurrency)
        self.assistantOverrides = try container.decodeIfPresent(AssistantOverrides.self, forKey: .assistantOverrides)
        self.squadOverrides = try container.decodeIfPresent(AssistantOverrides.self, forKey: .squadOverrides)
        self.server = try container.decodeIfPresent(Server.self, forKey: .server)
        self.serverMessages = try container.decodeIfPresent([CampaignSummaryServerMessagesItem].self, forKey: .serverMessages)
        self.predialPlan = try container.decodeIfPresent(CampaignPredialPlan.self, forKey: .predialPlan)
        self.contactCounters = try container.decodeIfPresent(CampaignContactCounters.self, forKey: .contactCounters)
        self.callMetrics = try container.decodeIfPresent(CampaignCallMetrics.self, forKey: .callMetrics)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.status, forKey: .status)
        try container.encodeIfPresent(self.endedReason, forKey: .endedReason)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
        try container.encodeIfPresent(self.squadId, forKey: .squadId)
        try container.encodeIfPresent(self.phoneNumberId, forKey: .phoneNumberId)
        try container.encodeIfPresent(self.schedulePlan, forKey: .schedulePlan)
        try container.encodeIfPresent(self.maxConcurrency, forKey: .maxConcurrency)
        try container.encodeIfPresent(self.assistantOverrides, forKey: .assistantOverrides)
        try container.encodeIfPresent(self.squadOverrides, forKey: .squadOverrides)
        try container.encodeIfPresent(self.server, forKey: .server)
        try container.encodeIfPresent(self.serverMessages, forKey: .serverMessages)
        try container.encodeIfPresent(self.predialPlan, forKey: .predialPlan)
        try container.encodeIfPresent(self.contactCounters, forKey: .contactCounters)
        try container.encodeIfPresent(self.callMetrics, forKey: .callMetrics)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case status
        case endedReason
        case name
        case assistantId
        case squadId
        case phoneNumberId
        case schedulePlan
        case maxConcurrency
        case assistantOverrides
        case squadOverrides
        case server
        case serverMessages
        case predialPlan
        case contactCounters
        case callMetrics
        case id
        case orgId
        case createdAt
        case updatedAt
    }
}