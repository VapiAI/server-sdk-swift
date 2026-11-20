import Foundation

public struct GetTrafficTabMetricsDto: Codable, Hashable, Sendable {
    /// The assistant whose per-version traffic metrics to return.
    public let assistantId: String
    /// Start of the metrics window (inclusive), ISO 8601 datetime.
    public let from: Date
    /// End of the metrics window (exclusive), ISO 8601 datetime. Must be later than from, and the window may hold at most 2000 buckets of the requested width.
    public let to: Date
    /// Bucket size for the timeseries. Defaults to 'day'.
    public let bucket: GetTrafficTabMetricsDtoBucket?
    /// Structured output ids to aggregate per version, as an array or a comma-separated string. At most 5.
    public let structuredOutputIds: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        assistantId: String,
        from: Date,
        to: Date,
        bucket: GetTrafficTabMetricsDtoBucket? = nil,
        structuredOutputIds: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.assistantId = assistantId
        self.from = from
        self.to = to
        self.bucket = bucket
        self.structuredOutputIds = structuredOutputIds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assistantId = try container.decode(String.self, forKey: .assistantId)
        self.from = try container.decode(Date.self, forKey: .from)
        self.to = try container.decode(Date.self, forKey: .to)
        self.bucket = try container.decodeIfPresent(GetTrafficTabMetricsDtoBucket.self, forKey: .bucket)
        self.structuredOutputIds = try container.decodeIfPresent([String].self, forKey: .structuredOutputIds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.assistantId, forKey: .assistantId)
        try container.encode(self.from, forKey: .from)
        try container.encode(self.to, forKey: .to)
        try container.encodeIfPresent(self.bucket, forKey: .bucket)
        try container.encodeIfPresent(self.structuredOutputIds, forKey: .structuredOutputIds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case assistantId
        case from
        case to
        case bucket
        case structuredOutputIds
    }
}