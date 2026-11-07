import Foundation

public struct CallHealthDashboardIssueSummaryDto: Codable, Hashable, Sendable {
    public let id: String
    public let name: String
    public let status: CallHealthDashboardIssueSummaryDtoStatus
    public let rowVersion: Int
    /// Owning goal identity; issue-ID routes derive this selection from the issue.
    public let goalId: String
    public let summary: String
    public let assistant: CallHealthDashboardAssistantReferenceDto
    public let affectedCallCount: Int
    /// Same assistant/current-goal/window denominator used by the goal reads.
    public let analyzedCallCount: Int
    /// Distinct calls matching this issue / analyzedCallCount; absent at zero.
    public let affectedCallRate: Double?
    /// One ascending contiguous page of UTC buckets; memberships across issues are not unique calls.
    public let dailySeries: [CallHealthDashboardIssueDailyDto]
    public let lastSeenAt: Date?
    public let coverage: CallHealthDashboardIssueCoverageDto
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: String,
        status: CallHealthDashboardIssueSummaryDtoStatus,
        rowVersion: Int,
        goalId: String,
        summary: String,
        assistant: CallHealthDashboardAssistantReferenceDto,
        affectedCallCount: Int,
        analyzedCallCount: Int,
        affectedCallRate: Double? = nil,
        dailySeries: [CallHealthDashboardIssueDailyDto],
        lastSeenAt: Date? = nil,
        coverage: CallHealthDashboardIssueCoverageDto,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.status = status
        self.rowVersion = rowVersion
        self.goalId = goalId
        self.summary = summary
        self.assistant = assistant
        self.affectedCallCount = affectedCallCount
        self.analyzedCallCount = analyzedCallCount
        self.affectedCallRate = affectedCallRate
        self.dailySeries = dailySeries
        self.lastSeenAt = lastSeenAt
        self.coverage = coverage
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.status = try container.decode(CallHealthDashboardIssueSummaryDtoStatus.self, forKey: .status)
        self.rowVersion = try container.decode(Int.self, forKey: .rowVersion)
        self.goalId = try container.decode(String.self, forKey: .goalId)
        self.summary = try container.decode(String.self, forKey: .summary)
        self.assistant = try container.decode(CallHealthDashboardAssistantReferenceDto.self, forKey: .assistant)
        self.affectedCallCount = try container.decode(Int.self, forKey: .affectedCallCount)
        self.analyzedCallCount = try container.decode(Int.self, forKey: .analyzedCallCount)
        self.affectedCallRate = try container.decodeIfPresent(Double.self, forKey: .affectedCallRate)
        self.dailySeries = try container.decode([CallHealthDashboardIssueDailyDto].self, forKey: .dailySeries)
        self.lastSeenAt = try container.decodeIfPresent(Date.self, forKey: .lastSeenAt)
        self.coverage = try container.decode(CallHealthDashboardIssueCoverageDto.self, forKey: .coverage)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.rowVersion, forKey: .rowVersion)
        try container.encode(self.goalId, forKey: .goalId)
        try container.encode(self.summary, forKey: .summary)
        try container.encode(self.assistant, forKey: .assistant)
        try container.encode(self.affectedCallCount, forKey: .affectedCallCount)
        try container.encode(self.analyzedCallCount, forKey: .analyzedCallCount)
        try container.encodeIfPresent(self.affectedCallRate, forKey: .affectedCallRate)
        try container.encode(self.dailySeries, forKey: .dailySeries)
        try container.encodeIfPresent(self.lastSeenAt, forKey: .lastSeenAt)
        try container.encode(self.coverage, forKey: .coverage)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case status
        case rowVersion
        case goalId
        case summary
        case assistant
        case affectedCallCount
        case analyzedCallCount
        case affectedCallRate
        case dailySeries
        case lastSeenAt
        case coverage
    }
}