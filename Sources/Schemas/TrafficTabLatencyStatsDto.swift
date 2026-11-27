import Foundation

public struct TrafficTabLatencyStatsDto: Codable, Hashable, Sendable {
    public let mean: Nullable<Double>?
    public let p50: Nullable<Double>?
    public let p95: Nullable<Double>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        mean: Nullable<Double>? = nil,
        p50: Nullable<Double>? = nil,
        p95: Nullable<Double>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.mean = mean
        self.p50 = p50
        self.p95 = p95
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.mean = try container.decodeNullableIfPresent(Double.self, forKey: .mean)
        self.p50 = try container.decodeNullableIfPresent(Double.self, forKey: .p50)
        self.p95 = try container.decodeNullableIfPresent(Double.self, forKey: .p95)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.mean, forKey: .mean)
        try container.encodeNullableIfPresent(self.p50, forKey: .p50)
        try container.encodeNullableIfPresent(self.p95, forKey: .p95)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case mean
        case p50
        case p95
    }
}