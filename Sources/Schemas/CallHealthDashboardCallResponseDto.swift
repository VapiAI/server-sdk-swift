import Foundation

public struct CallHealthDashboardCallResponseDto: Codable, Hashable, Sendable {
    public let callId: String
    public let assistantId: String
    /// Selected goal identity.
    public let goalId: String
    /// The assistant version the call ran on; absent when it ran on none.
    public let assistantVersionId: String?
    /// That version's label, such as v3; absent when the call ran on none or the label was unavailable at registration.
    public let assistantVersion: String?
    /// Classification state, named as in the coverage `classification` counters.
    public let assessmentState: CallHealthDashboardCallResponseDtoAssessmentState
    /// The call's main failure category; absent when classification selected none.
    public let primaryCategoryKey: String?
    /// The other selected categories, in ascending key order.
    public let otherCategoryKeys: [String]
    /// Visible issues the call joined, in ascending ID order.
    public let issues: [CallHealthDashboardCallIssueDto]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        callId: String,
        assistantId: String,
        goalId: String,
        assistantVersionId: String? = nil,
        assistantVersion: String? = nil,
        assessmentState: CallHealthDashboardCallResponseDtoAssessmentState,
        primaryCategoryKey: String? = nil,
        otherCategoryKeys: [String],
        issues: [CallHealthDashboardCallIssueDto],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.callId = callId
        self.assistantId = assistantId
        self.goalId = goalId
        self.assistantVersionId = assistantVersionId
        self.assistantVersion = assistantVersion
        self.assessmentState = assessmentState
        self.primaryCategoryKey = primaryCategoryKey
        self.otherCategoryKeys = otherCategoryKeys
        self.issues = issues
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.callId = try container.decode(String.self, forKey: .callId)
        self.assistantId = try container.decode(String.self, forKey: .assistantId)
        self.goalId = try container.decode(String.self, forKey: .goalId)
        self.assistantVersionId = try container.decodeIfPresent(String.self, forKey: .assistantVersionId)
        self.assistantVersion = try container.decodeIfPresent(String.self, forKey: .assistantVersion)
        self.assessmentState = try container.decode(CallHealthDashboardCallResponseDtoAssessmentState.self, forKey: .assessmentState)
        self.primaryCategoryKey = try container.decodeIfPresent(String.self, forKey: .primaryCategoryKey)
        self.otherCategoryKeys = try container.decode([String].self, forKey: .otherCategoryKeys)
        self.issues = try container.decode([CallHealthDashboardCallIssueDto].self, forKey: .issues)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.callId, forKey: .callId)
        try container.encode(self.assistantId, forKey: .assistantId)
        try container.encode(self.goalId, forKey: .goalId)
        try container.encodeIfPresent(self.assistantVersionId, forKey: .assistantVersionId)
        try container.encodeIfPresent(self.assistantVersion, forKey: .assistantVersion)
        try container.encode(self.assessmentState, forKey: .assessmentState)
        try container.encodeIfPresent(self.primaryCategoryKey, forKey: .primaryCategoryKey)
        try container.encode(self.otherCategoryKeys, forKey: .otherCategoryKeys)
        try container.encode(self.issues, forKey: .issues)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case callId
        case assistantId
        case goalId
        case assistantVersionId
        case assistantVersion
        case assessmentState
        case primaryCategoryKey
        case otherCategoryKeys
        case issues
    }
}