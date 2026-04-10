import Foundation

public struct Scorecard: Codable, Hashable, Sendable {
    /// This is the unique identifier for the scorecard.
    public let id: String
    /// This is the unique identifier for the org that this scorecard belongs to.
    public let orgId: String
    /// This is the ISO 8601 date-time string of when the scorecard was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the scorecard was last updated.
    public let updatedAt: Date
    /// This is the name of the scorecard. It is only for user reference and will not be used for any evaluation.
    public let name: String?
    /// This is the description of the scorecard. It is only for user reference and will not be used for any evaluation.
    public let description: String?
    /// These are the metrics that will be used to evaluate the scorecard.
    /// Each metric will have a set of conditions and points that will be used to generate the score.
    public let metrics: [ScorecardMetric]
    /// These are the assistant IDs that this scorecard is linked to.
    /// When linked to assistants, this scorecard will be available for evaluation during those assistants' calls.
    public let assistantIds: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        name: String? = nil,
        description: String? = nil,
        metrics: [ScorecardMetric],
        assistantIds: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.description = description
        self.metrics = metrics
        self.assistantIds = assistantIds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.metrics = try container.decode([ScorecardMetric].self, forKey: .metrics)
        self.assistantIds = try container.decodeIfPresent([String].self, forKey: .assistantIds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encode(self.metrics, forKey: .metrics)
        try container.encodeIfPresent(self.assistantIds, forKey: .assistantIds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case orgId
        case createdAt
        case updatedAt
        case name
        case description
        case metrics
        case assistantIds
    }
}