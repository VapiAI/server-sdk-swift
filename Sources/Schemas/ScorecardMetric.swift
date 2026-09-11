import Foundation

/// A scorecard metric that awards points when a structured output meets its configured conditions.
public struct ScorecardMetric: Codable, Hashable, Sendable {
    /// These are the conditions that will be used to evaluate the scorecard.
    /// Each condition will have a comparator, value, and points that will be used to calculate the final score.
    /// The points will be added to the overall score if the condition is met.
    /// The overall score will be normalized to a 100 point scale to ensure uniformity across different scorecards.
    public let conditions: [ScorecardMetricConditionsItem]
    /// This is the unique identifier for the structured output that will be used to evaluate the scorecard.
    /// The structured output must be of type number or boolean only for now.
    public let structuredOutputId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        conditions: [ScorecardMetricConditionsItem],
        structuredOutputId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.conditions = conditions
        self.structuredOutputId = structuredOutputId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.conditions = try container.decode([ScorecardMetricConditionsItem].self, forKey: .conditions)
        self.structuredOutputId = try container.decode(String.self, forKey: .structuredOutputId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.conditions, forKey: .conditions)
        try container.encode(self.structuredOutputId, forKey: .structuredOutputId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case conditions
        case structuredOutputId
    }
}