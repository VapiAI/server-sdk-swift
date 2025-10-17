import Foundation

public struct TimeRange: Codable, Hashable, Sendable {
    /// This is the time step for aggregations.
    /// 
    /// If not provided, defaults to returning for the entire time range.
    public let step: TimeRangeStep?
    /// This is the start date for the time range.
    /// 
    /// If not provided, defaults to the 7 days ago.
    public let start: Date?
    /// This is the end date for the time range.
    /// 
    /// If not provided, defaults to now.
    public let end: Date?
    /// This is the timezone you want to set for the query.
    /// 
    /// If not provided, defaults to UTC.
    public let timezone: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        step: TimeRangeStep? = nil,
        start: Date? = nil,
        end: Date? = nil,
        timezone: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.step = step
        self.start = start
        self.end = end
        self.timezone = timezone
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.step = try container.decodeIfPresent(TimeRangeStep.self, forKey: .step)
        self.start = try container.decodeIfPresent(Date.self, forKey: .start)
        self.end = try container.decodeIfPresent(Date.self, forKey: .end)
        self.timezone = try container.decodeIfPresent(String.self, forKey: .timezone)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.step, forKey: .step)
        try container.encodeIfPresent(self.start, forKey: .start)
        try container.encodeIfPresent(self.end, forKey: .end)
        try container.encodeIfPresent(self.timezone, forKey: .timezone)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case step
        case start
        case end
        case timezone
    }
}