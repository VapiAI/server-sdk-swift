import Foundation

public struct InsightTimeRange: Codable, Hashable, Sendable {
    /// This is the start date for the time range.
    /// 
    /// Should be a valid ISO 8601 date-time string or relative time string.
    /// If not provided, defaults to the 7 days ago.
    /// 
    /// Relative time strings of the format "-{number}{unit}" are allowed.
    /// 
    /// Valid units are:
    /// - d: days
    /// - h: hours
    /// - w: weeks
    /// - m: months
    /// - y: years
    public let start: [String: JSONValue]?
    /// This is the end date for the time range.
    /// 
    /// Should be a valid ISO 8601 date-time string or relative time string.
    /// If not provided, defaults to now.
    /// 
    /// Relative time strings of the format "-{number}{unit}" are allowed.
    /// 
    /// Valid units are:
    /// - d: days
    /// - h: hours
    /// - w: weeks
    /// - m: months
    /// - y: years
    public let end: [String: JSONValue]?
    /// This is the timezone you want to set for the query.
    /// 
    /// If not provided, defaults to UTC.
    public let timezone: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        start: [String: JSONValue]? = nil,
        end: [String: JSONValue]? = nil,
        timezone: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.start = start
        self.end = end
        self.timezone = timezone
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.start = try container.decodeIfPresent([String: JSONValue].self, forKey: .start)
        self.end = try container.decodeIfPresent([String: JSONValue].self, forKey: .end)
        self.timezone = try container.decodeIfPresent(String.self, forKey: .timezone)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.start, forKey: .start)
        try container.encodeIfPresent(self.end, forKey: .end)
        try container.encodeIfPresent(self.timezone, forKey: .timezone)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case start
        case end
        case timezone
    }
}