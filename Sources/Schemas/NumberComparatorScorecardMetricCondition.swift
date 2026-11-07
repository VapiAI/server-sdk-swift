import Foundation

public struct NumberComparatorScorecardMetricCondition: Codable, Hashable, Sendable {
    /// This is the type of the condition. Currently only 'comparator' is supported.
    public let type: NumberComparatorScorecardMetricConditionType
    /// This is the comparator that will be used to compare the result of the structured output with the value specified.
    /// Only '=', '!=', '>', '<', '>=', and '<=' are supported for number conditions
    /// Only '=' is supported for boolean conditions.
    public let comparator: NumberComparatorScorecardMetricConditionComparator
    /// This is the value that will be used to compare the result of the structured output with the comparator.
    /// If the result of the comparison is true, the points will be added to the overall score.
    public let value: Double
    /// These are the points that will be added to the overall score if the condition is met.
    /// The points must be between 0 and 100.
    public let points: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: NumberComparatorScorecardMetricConditionType,
        comparator: NumberComparatorScorecardMetricConditionComparator,
        value: Double,
        points: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.comparator = comparator
        self.value = value
        self.points = points
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(NumberComparatorScorecardMetricConditionType.self, forKey: .type)
        self.comparator = try container.decode(NumberComparatorScorecardMetricConditionComparator.self, forKey: .comparator)
        self.value = try container.decode(Double.self, forKey: .value)
        self.points = try container.decode(Double.self, forKey: .points)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.comparator, forKey: .comparator)
        try container.encode(self.value, forKey: .value)
        try container.encode(self.points, forKey: .points)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case comparator
        case value
        case points
    }
}