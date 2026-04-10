import Foundation

public struct ScorecardMetric: Codable, Hashable, Sendable {
    /// This is the unique identifier for the structured output that will be used to evaluate the scorecard.
    /// The structured output must be of type number or boolean only for now.
    public let structuredOutputId: String
    /// These are the conditions that will be used to evaluate the scorecard.
    /// Each condition will have a comparator, value, and points that will be used to calculate the final score.
    /// The points will be added to the overall score if the condition is met.
    /// The overall score will be normalized to a 100 point scale to ensure uniformity across different scorecards.
    public let conditions: [[String: JSONValue]]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        structuredOutputId: String,
        conditions: [[String: JSONValue]],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.structuredOutputId = structuredOutputId
        self.conditions = conditions
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.structuredOutputId = try container.decode(String.self, forKey: .structuredOutputId)
        self.conditions = try container.decode([[String: JSONValue]].self, forKey: .conditions)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.structuredOutputId, forKey: .structuredOutputId)
        try container.encode(self.conditions, forKey: .conditions)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case structuredOutputId
        case conditions
    }
}