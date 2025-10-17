import Foundation

public struct AnalyticsQueryResult: Codable, Hashable, Sendable {
    /// This is the unique key for the query.
    public let name: String
    /// This is the time range for the query.
    public let timeRange: TimeRange
    /// This is the result of the query, a list of unique groups with result of their aggregations.
    /// 
    /// Example:
    /// "result": [
    ///   { "date": "2023-01-01", "assistantId": "123", "endedReason": "customer-ended-call", "sumDuration": 120, "avgCost": 10.5 },
    ///   { "date": "2023-01-02", "assistantId": "123", "endedReason": "customer-did-not-give-microphone-permission", "sumDuration": 0, "avgCost": 0 },
    ///   // Additional results
    /// ]
    public let result: [[String: JSONValue]]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        timeRange: TimeRange,
        result: [[String: JSONValue]],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.timeRange = timeRange
        self.result = result
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.timeRange = try container.decode(TimeRange.self, forKey: .timeRange)
        self.result = try container.decode([[String: JSONValue]].self, forKey: .result)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.timeRange, forKey: .timeRange)
        try container.encode(self.result, forKey: .result)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case timeRange
        case result
    }
}