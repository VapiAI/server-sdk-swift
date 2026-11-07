import Foundation

public struct TrafficTabTimeseriesPointDto: Codable, Hashable, Sendable {
    /// Start of the bucket, ISO 8601 (UTC).
    public let bucketStart: String
    public let calls: Double
    public let durationSecondsMean: Nullable<Double>?
    public let costPerMinuteMean: Nullable<Double>?
    public let turnLatencyMsMean: Nullable<Double>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bucketStart: String,
        calls: Double,
        durationSecondsMean: Nullable<Double>? = nil,
        costPerMinuteMean: Nullable<Double>? = nil,
        turnLatencyMsMean: Nullable<Double>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bucketStart = bucketStart
        self.calls = calls
        self.durationSecondsMean = durationSecondsMean
        self.costPerMinuteMean = costPerMinuteMean
        self.turnLatencyMsMean = turnLatencyMsMean
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bucketStart = try container.decode(String.self, forKey: .bucketStart)
        self.calls = try container.decode(Double.self, forKey: .calls)
        self.durationSecondsMean = try container.decodeNullableIfPresent(Double.self, forKey: .durationSecondsMean)
        self.costPerMinuteMean = try container.decodeNullableIfPresent(Double.self, forKey: .costPerMinuteMean)
        self.turnLatencyMsMean = try container.decodeNullableIfPresent(Double.self, forKey: .turnLatencyMsMean)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.bucketStart, forKey: .bucketStart)
        try container.encode(self.calls, forKey: .calls)
        try container.encodeNullableIfPresent(self.durationSecondsMean, forKey: .durationSecondsMean)
        try container.encodeNullableIfPresent(self.costPerMinuteMean, forKey: .costPerMinuteMean)
        try container.encodeNullableIfPresent(self.turnLatencyMsMean, forKey: .turnLatencyMsMean)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bucketStart
        case calls
        case durationSecondsMean
        case costPerMinuteMean
        case turnLatencyMsMean
    }
}