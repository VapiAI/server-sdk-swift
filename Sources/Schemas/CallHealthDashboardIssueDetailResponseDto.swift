import Foundation

public struct CallHealthDashboardIssueDetailResponseDto: Codable, Hashable, Sendable {
    public let issue: CallHealthDashboardIssueSummaryDto
    public let seriesPage: CallHealthDashboardSeriesPageDto
    public let definition: CallHealthDashboardIssueDefinitionDto
    public let coverage: CallHealthDashboardCoverageDto
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        issue: CallHealthDashboardIssueSummaryDto,
        seriesPage: CallHealthDashboardSeriesPageDto,
        definition: CallHealthDashboardIssueDefinitionDto,
        coverage: CallHealthDashboardCoverageDto,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.issue = issue
        self.seriesPage = seriesPage
        self.definition = definition
        self.coverage = coverage
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.issue = try container.decode(CallHealthDashboardIssueSummaryDto.self, forKey: .issue)
        self.seriesPage = try container.decode(CallHealthDashboardSeriesPageDto.self, forKey: .seriesPage)
        self.definition = try container.decode(CallHealthDashboardIssueDefinitionDto.self, forKey: .definition)
        self.coverage = try container.decode(CallHealthDashboardCoverageDto.self, forKey: .coverage)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.issue, forKey: .issue)
        try container.encode(self.seriesPage, forKey: .seriesPage)
        try container.encode(self.definition, forKey: .definition)
        try container.encode(self.coverage, forKey: .coverage)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case issue
        case seriesPage
        case definition
        case coverage
    }
}