import Foundation

public struct Campaign: Codable, Hashable, Sendable {
    /// This is the status of the campaign.
    public let status: CampaignStatus
    /// This is the explanation for how the campaign ended.
    public let endedReason: CampaignEndedReason?
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
    /// These are the customers that will be called in the campaign. Required if dialPlan is not provided.
    public let customers: [CreateCustomerDto]?
    /// This is the unique identifier for the campaign.
    public let id: String
    /// This is the unique identifier for the org that this campaign belongs to.
    public let orgId: String
    /// This is the ISO 8601 date-time string of when the campaign was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the campaign was last updated.
    public let updatedAt: Date
    /// This is a map of call IDs to campaign call details.
    public let calls: [String: JSONValue]
    /// This is the number of calls that have been scheduled.
    public let callsCounterScheduled: Double
    /// This is the number of calls that have been queued.
    public let callsCounterQueued: Double
    /// This is the number of calls that have been in progress.
    public let callsCounterInProgress: Double
    /// This is the number of calls whose ended reason is 'voicemail'.
    public let callsCounterEndedVoicemail: Double
    /// This is the number of calls that have ended.
    public let callsCounterEnded: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        status: CampaignStatus,
        endedReason: CampaignEndedReason? = nil,
        name: String,
        assistantId: String? = nil,
        workflowId: String? = nil,
        squadId: String? = nil,
        phoneNumberId: String? = nil,
        dialPlan: [DialPlanEntry]? = nil,
        schedulePlan: SchedulePlan? = nil,
        customers: [CreateCustomerDto]? = nil,
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        calls: [String: JSONValue],
        callsCounterScheduled: Double,
        callsCounterQueued: Double,
        callsCounterInProgress: Double,
        callsCounterEndedVoicemail: Double,
        callsCounterEnded: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.status = status
        self.endedReason = endedReason
        self.name = name
        self.assistantId = assistantId
        self.workflowId = workflowId
        self.squadId = squadId
        self.phoneNumberId = phoneNumberId
        self.dialPlan = dialPlan
        self.schedulePlan = schedulePlan
        self.customers = customers
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.calls = calls
        self.callsCounterScheduled = callsCounterScheduled
        self.callsCounterQueued = callsCounterQueued
        self.callsCounterInProgress = callsCounterInProgress
        self.callsCounterEndedVoicemail = callsCounterEndedVoicemail
        self.callsCounterEnded = callsCounterEnded
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(CampaignStatus.self, forKey: .status)
        self.endedReason = try container.decodeIfPresent(CampaignEndedReason.self, forKey: .endedReason)
        self.name = try container.decode(String.self, forKey: .name)
        self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
        self.workflowId = try container.decodeIfPresent(String.self, forKey: .workflowId)
        self.squadId = try container.decodeIfPresent(String.self, forKey: .squadId)
        self.phoneNumberId = try container.decodeIfPresent(String.self, forKey: .phoneNumberId)
        self.dialPlan = try container.decodeIfPresent([DialPlanEntry].self, forKey: .dialPlan)
        self.schedulePlan = try container.decodeIfPresent(SchedulePlan.self, forKey: .schedulePlan)
        self.customers = try container.decodeIfPresent([CreateCustomerDto].self, forKey: .customers)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.calls = try container.decode([String: JSONValue].self, forKey: .calls)
        self.callsCounterScheduled = try container.decode(Double.self, forKey: .callsCounterScheduled)
        self.callsCounterQueued = try container.decode(Double.self, forKey: .callsCounterQueued)
        self.callsCounterInProgress = try container.decode(Double.self, forKey: .callsCounterInProgress)
        self.callsCounterEndedVoicemail = try container.decode(Double.self, forKey: .callsCounterEndedVoicemail)
        self.callsCounterEnded = try container.decode(Double.self, forKey: .callsCounterEnded)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.status, forKey: .status)
        try container.encodeIfPresent(self.endedReason, forKey: .endedReason)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
        try container.encodeIfPresent(self.workflowId, forKey: .workflowId)
        try container.encodeIfPresent(self.squadId, forKey: .squadId)
        try container.encodeIfPresent(self.phoneNumberId, forKey: .phoneNumberId)
        try container.encodeIfPresent(self.dialPlan, forKey: .dialPlan)
        try container.encodeIfPresent(self.schedulePlan, forKey: .schedulePlan)
        try container.encodeIfPresent(self.customers, forKey: .customers)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.calls, forKey: .calls)
        try container.encode(self.callsCounterScheduled, forKey: .callsCounterScheduled)
        try container.encode(self.callsCounterQueued, forKey: .callsCounterQueued)
        try container.encode(self.callsCounterInProgress, forKey: .callsCounterInProgress)
        try container.encode(self.callsCounterEndedVoicemail, forKey: .callsCounterEndedVoicemail)
        try container.encode(self.callsCounterEnded, forKey: .callsCounterEnded)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case status
        case endedReason
        case name
        case assistantId
        case workflowId
        case squadId
        case phoneNumberId
        case dialPlan
        case schedulePlan
        case customers
        case id
        case orgId
        case createdAt
        case updatedAt
        case calls
        case callsCounterScheduled
        case callsCounterQueued
        case callsCounterInProgress
        case callsCounterEndedVoicemail
        case callsCounterEnded
    }
}