import Foundation

public struct TrafficTabMetricsDto: Codable, Hashable, Sendable {
    public let window: TrafficTabMetricsWindowDto
    /// All calls for the assistant in the window, every version.
    public let totalCalls: Double
    /// The allocation currently governing the assistant. Null when traffic splitting was never configured.
    public let currentAllocation: Nullable<TrafficAllocation>?
    /// One row per version with calls in the window, plus the unversioned row when it has any. Ordered by calls descending, then by version label (numeric-aware), the unversioned row last among equals.
    public let versions: [TrafficTabVersionMetricsDto]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        window: TrafficTabMetricsWindowDto,
        totalCalls: Double,
        currentAllocation: Nullable<TrafficAllocation>? = nil,
        versions: [TrafficTabVersionMetricsDto],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.window = window
        self.totalCalls = totalCalls
        self.currentAllocation = currentAllocation
        self.versions = versions
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.window = try container.decode(TrafficTabMetricsWindowDto.self, forKey: .window)
        self.totalCalls = try container.decode(Double.self, forKey: .totalCalls)
        self.currentAllocation = try container.decodeNullableIfPresent(TrafficAllocation.self, forKey: .currentAllocation)
        self.versions = try container.decode([TrafficTabVersionMetricsDto].self, forKey: .versions)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.window, forKey: .window)
        try container.encode(self.totalCalls, forKey: .totalCalls)
        try container.encodeNullableIfPresent(self.currentAllocation, forKey: .currentAllocation)
        try container.encode(self.versions, forKey: .versions)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case window
        case totalCalls
        case currentAllocation
        case versions
    }
}