import Foundation

public struct TrafficTabCostPerMinuteDto: Codable, Hashable, Sendable {
    public let mean: Nullable<Double>?
    public let breakdown: TrafficTabCostBreakdownPerMinuteDto
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        mean: Nullable<Double>? = nil,
        breakdown: TrafficTabCostBreakdownPerMinuteDto,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.mean = mean
        self.breakdown = breakdown
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.mean = try container.decodeNullableIfPresent(Double.self, forKey: .mean)
        self.breakdown = try container.decode(TrafficTabCostBreakdownPerMinuteDto.self, forKey: .breakdown)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.mean, forKey: .mean)
        try container.encode(self.breakdown, forKey: .breakdown)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case mean
        case breakdown
    }
}