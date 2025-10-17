import Foundation

public struct Campaign: Codable, Hashable, Sendable {
    /// This is the status of the campaign.
    public let status: CampaignStatus
    /// This is the explanation for how the campaign ended.
    public let endedReason: CampaignEndedReason?
    /// This is the name of the campaign. This is just for your own reference.
    public let name: String
    /// This is the assistant ID that will be used for the campaign calls. Note: Either assistantId or workflowId can be used, but not both.
    public let assistantId: String?
    /// This is the workflow ID that will be used for the campaign calls. Note: Either assistantId or workflowId can be used, but not both.
    public let workflowId: String?
    /// This is the phone number ID that will be used for the campaign calls.
    public let phoneNumberId: String
    /// This is the schedule plan for the campaign.
    public let schedulePlan: SchedulePlan?
    /// These are the customers that will be called in the campaign.
    public let customers: [CreateCustomerDto]
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
        phoneNumberId: String,
        schedulePlan: SchedulePlan? = nil,
        customers: [CreateCustomerDto],
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
        self.phoneNumberId = phoneNumberId
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
        self.phoneNumberId = try container.decode(String.self, forKey: .phoneNumberId)
        self.schedulePlan = try container.decodeIfPresent(SchedulePlan.self, forKey: .schedulePlan)
        self.customers = try container.decode([CreateCustomerDto].self, forKey: .customers)
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
        try container.encode(self.phoneNumberId, forKey: .phoneNumberId)
        try container.encodeIfPresent(self.schedulePlan, forKey: .schedulePlan)
        try container.encode(self.customers, forKey: .customers)
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
        case phoneNumberId
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