import Foundation

public struct CallHealthDashboardGoalCallDto: Codable, Hashable, Sendable {
    /// The call this row reports the goal result for.
    public let callId: String
    /// Call completion time (endedAt), never startedAt.
    public let callTime: Date
    /// Current goal revision the result belongs to; the list returns no other revision.
    public let goalVersion: String
    /// Where this call's evaluation under goalVersion stands.
    public let processingState: CallHealthDashboardGoalCallDtoProcessingState
    /// Absent until a result is accepted; a processing failure is never goal_not_met.
    public let goalOutcome: CallHealthDashboardGoalCallDtoGoalOutcome?
    /// The assistant version the call ran on; absent when it ran on none.
    public let assistantVersionId: String?
    /// That version's label, such as v3; absent when the call ran on none or the label was unavailable at registration.
    public let assistantVersion: String?
    /// The call's main failure category, the same as GET /call-health/call/{id} returns; absent when the call has no current classification or it selected none.
    public let primaryCategoryKey: String?
    /// Visible issues the call joined, in ascending ID order, the same as GET /call-health/call/{id} returns; empty when it joined none.
    public let issues: [CallHealthDashboardGoalCallIssueDto]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        callId: String,
        callTime: Date,
        goalVersion: String,
        processingState: CallHealthDashboardGoalCallDtoProcessingState,
        goalOutcome: CallHealthDashboardGoalCallDtoGoalOutcome? = nil,
        assistantVersionId: String? = nil,
        assistantVersion: String? = nil,
        primaryCategoryKey: String? = nil,
        issues: [CallHealthDashboardGoalCallIssueDto],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.callId = callId
        self.callTime = callTime
        self.goalVersion = goalVersion
        self.processingState = processingState
        self.goalOutcome = goalOutcome
        self.assistantVersionId = assistantVersionId
        self.assistantVersion = assistantVersion
        self.primaryCategoryKey = primaryCategoryKey
        self.issues = issues
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.callId = try container.decode(String.self, forKey: .callId)
        self.callTime = try container.decode(Date.self, forKey: .callTime)
        self.goalVersion = try container.decode(String.self, forKey: .goalVersion)
        self.processingState = try container.decode(CallHealthDashboardGoalCallDtoProcessingState.self, forKey: .processingState)
        self.goalOutcome = try container.decodeIfPresent(CallHealthDashboardGoalCallDtoGoalOutcome.self, forKey: .goalOutcome)
        self.assistantVersionId = try container.decodeIfPresent(String.self, forKey: .assistantVersionId)
        self.assistantVersion = try container.decodeIfPresent(String.self, forKey: .assistantVersion)
        self.primaryCategoryKey = try container.decodeIfPresent(String.self, forKey: .primaryCategoryKey)
        self.issues = try container.decode([CallHealthDashboardGoalCallIssueDto].self, forKey: .issues)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.callId, forKey: .callId)
        try container.encode(self.callTime, forKey: .callTime)
        try container.encode(self.goalVersion, forKey: .goalVersion)
        try container.encode(self.processingState, forKey: .processingState)
        try container.encodeIfPresent(self.goalOutcome, forKey: .goalOutcome)
        try container.encodeIfPresent(self.assistantVersionId, forKey: .assistantVersionId)
        try container.encodeIfPresent(self.assistantVersion, forKey: .assistantVersion)
        try container.encodeIfPresent(self.primaryCategoryKey, forKey: .primaryCategoryKey)
        try container.encode(self.issues, forKey: .issues)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case callId
        case callTime
        case goalVersion
        case processingState
        case goalOutcome
        case assistantVersionId
        case assistantVersion
        case primaryCategoryKey
        case issues
    }
}