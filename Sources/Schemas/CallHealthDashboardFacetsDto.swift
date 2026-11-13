import Foundation

public struct CallHealthDashboardFacetsDto: Codable, Hashable, Sendable {
    public let statuses: [CallHealthDashboardFacetsDtoStatusesItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        statuses: [CallHealthDashboardFacetsDtoStatusesItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.statuses = statuses
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.statuses = try container.decode([CallHealthDashboardFacetsDtoStatusesItem].self, forKey: .statuses)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.statuses, forKey: .statuses)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case statuses
    }
}