import Foundation

public struct LineInsightMetadata: Codable, Hashable, Sendable {
    public let xAxisLabel: String?
    public let yAxisLabel: String?
    public let yAxisMin: Double?
    public let yAxisMax: Double?
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        xAxisLabel: String? = nil,
        yAxisLabel: String? = nil,
        yAxisMin: Double? = nil,
        yAxisMax: Double? = nil,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.xAxisLabel = xAxisLabel
        self.yAxisLabel = yAxisLabel
        self.yAxisMin = yAxisMin
        self.yAxisMax = yAxisMax
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.xAxisLabel = try container.decodeIfPresent(String.self, forKey: .xAxisLabel)
        self.yAxisLabel = try container.decodeIfPresent(String.self, forKey: .yAxisLabel)
        self.yAxisMin = try container.decodeIfPresent(Double.self, forKey: .yAxisMin)
        self.yAxisMax = try container.decodeIfPresent(Double.self, forKey: .yAxisMax)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.xAxisLabel, forKey: .xAxisLabel)
        try container.encodeIfPresent(self.yAxisLabel, forKey: .yAxisLabel)
        try container.encodeIfPresent(self.yAxisMin, forKey: .yAxisMin)
        try container.encodeIfPresent(self.yAxisMax, forKey: .yAxisMax)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case xAxisLabel
        case yAxisLabel
        case yAxisMin
        case yAxisMax
        case name
    }
}