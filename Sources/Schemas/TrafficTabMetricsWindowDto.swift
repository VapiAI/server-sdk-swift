import Foundation

public struct TrafficTabMetricsWindowDto: Codable, Hashable, Sendable {
    /// Start of the window (inclusive), ISO 8601.
    public let from: String
    /// End of the window (exclusive), ISO 8601.
    public let to: String
    public let bucket: TrafficTabMetricsWindowDtoBucket
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        from: String,
        to: String,
        bucket: TrafficTabMetricsWindowDtoBucket,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.from = from
        self.to = to
        self.bucket = bucket
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.from = try container.decode(String.self, forKey: .from)
        self.to = try container.decode(String.self, forKey: .to)
        self.bucket = try container.decode(TrafficTabMetricsWindowDtoBucket.self, forKey: .bucket)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.from, forKey: .from)
        try container.encode(self.to, forKey: .to)
        try container.encode(self.bucket, forKey: .bucket)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case from
        case to
        case bucket
    }
}