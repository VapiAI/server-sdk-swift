import Foundation

public struct EventsTableNumberCondition: Codable, Hashable, Sendable {
    /// The number field name from the event data
    public let column: String
    /// Number comparison operator
    public let `operator`: EventsTableNumberConditionOperator
    /// The number value to compare
    public let value: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        column: String,
        operator: EventsTableNumberConditionOperator,
        value: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.column = column
        self.operator = `operator`
        self.value = value
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.column = try container.decode(String.self, forKey: .column)
        self.operator = try container.decode(EventsTableNumberConditionOperator.self, forKey: .operator)
        self.value = try container.decode(Double.self, forKey: .value)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.column, forKey: .column)
        try container.encode(self.operator, forKey: .operator)
        try container.encode(self.value, forKey: .value)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case column
        case `operator`
        case value
    }
}