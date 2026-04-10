import Foundation

public struct EventsTableStringCondition: Codable, Hashable, Sendable {
    /// The string field name from the event data
    public let column: String
    /// String comparison operator
    public let `operator`: EventsTableStringConditionOperator
    /// The string value to compare
    public let value: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        column: String,
        operator: EventsTableStringConditionOperator,
        value: String,
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
        self.operator = try container.decode(EventsTableStringConditionOperator.self, forKey: .operator)
        self.value = try container.decode(String.self, forKey: .value)
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