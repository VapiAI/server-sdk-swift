import Foundation

public struct CallHealthDashboardGoalCallsResponseDto: Codable, Hashable, Sendable {
    /// Newest completion first, then call UUID descending.
    public let results: [CallHealthDashboardGoalCallDto]
    /// Continues the list after the last result; absent on the last page.
    public let nextCursor: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        results: [CallHealthDashboardGoalCallDto],
        nextCursor: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.results = results
        self.nextCursor = nextCursor
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decode([CallHealthDashboardGoalCallDto].self, forKey: .results)
        self.nextCursor = try container.decodeIfPresent(String.self, forKey: .nextCursor)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.results, forKey: .results)
        try container.encodeIfPresent(self.nextCursor, forKey: .nextCursor)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case results
        case nextCursor
    }
}