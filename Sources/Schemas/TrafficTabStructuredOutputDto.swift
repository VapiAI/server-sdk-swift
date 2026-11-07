import Foundation

public struct TrafficTabStructuredOutputDto: Codable, Hashable, Sendable {
    public let structuredOutputId: String
    public let type: TrafficTabStructuredOutputDtoType
    /// Calls in the window where this output produced a result.
    public let present: Double
    public let numeric: TrafficTabStructuredOutputNumericDto?
    /// Top 10 values by count, for string/boolean outputs.
    public let valueCounts: [TrafficTabStructuredOutputValueCountDto]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        structuredOutputId: String,
        type: TrafficTabStructuredOutputDtoType,
        present: Double,
        numeric: TrafficTabStructuredOutputNumericDto? = nil,
        valueCounts: [TrafficTabStructuredOutputValueCountDto]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.structuredOutputId = structuredOutputId
        self.type = type
        self.present = present
        self.numeric = numeric
        self.valueCounts = valueCounts
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.structuredOutputId = try container.decode(String.self, forKey: .structuredOutputId)
        self.type = try container.decode(TrafficTabStructuredOutputDtoType.self, forKey: .type)
        self.present = try container.decode(Double.self, forKey: .present)
        self.numeric = try container.decodeIfPresent(TrafficTabStructuredOutputNumericDto.self, forKey: .numeric)
        self.valueCounts = try container.decodeIfPresent([TrafficTabStructuredOutputValueCountDto].self, forKey: .valueCounts)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.structuredOutputId, forKey: .structuredOutputId)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.present, forKey: .present)
        try container.encodeIfPresent(self.numeric, forKey: .numeric)
        try container.encodeIfPresent(self.valueCounts, forKey: .valueCounts)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case structuredOutputId
        case type
        case present
        case numeric
        case valueCounts
    }
}