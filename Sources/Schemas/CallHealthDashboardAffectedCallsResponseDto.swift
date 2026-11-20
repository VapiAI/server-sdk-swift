import Foundation

public struct CallHealthDashboardAffectedCallsResponseDto: Codable, Hashable, Sendable {
    public let results: [CallHealthDashboardAffectedCallDto]
    public let nextCursor: String?
    public let coverage: CallHealthDashboardCoverageDto
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        results: [CallHealthDashboardAffectedCallDto],
        nextCursor: String? = nil,
        coverage: CallHealthDashboardCoverageDto,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.results = results
        self.nextCursor = nextCursor
        self.coverage = coverage
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decode([CallHealthDashboardAffectedCallDto].self, forKey: .results)
        self.nextCursor = try container.decodeIfPresent(String.self, forKey: .nextCursor)
        self.coverage = try container.decode(CallHealthDashboardCoverageDto.self, forKey: .coverage)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.results, forKey: .results)
        try container.encodeIfPresent(self.nextCursor, forKey: .nextCursor)
        try container.encode(self.coverage, forKey: .coverage)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case results
        case nextCursor
        case coverage
    }
}