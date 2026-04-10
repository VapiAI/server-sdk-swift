import Foundation

public struct FilterStructuredOutputColumnOnCallTable: Codable, Hashable, Sendable {
    /// This is the column in the call table that will be filtered on.
    /// Structured Output Type columns are only to filter on artifact.structuredOutputs[OutputID] column.
    public let column: FilterStructuredOutputColumnOnCallTableColumn
    /// This is the operator to use for the filter.
    /// The operator depends on the value type of the structured output.
    /// If the structured output is a string or boolean, the operator must be "=", "!="
    /// If the structured output is a number, the operator must be "=", ">", "<", ">=", "<="
    /// If the structured output is an array, the operator must be "in" or "not_in"
    public let `operator`: FilterStructuredOutputColumnOnCallTableOperator
    /// This is the value to filter on.
    /// The value type depends on the structured output type being filtered.
    public let value: [String: JSONValue]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        column: FilterStructuredOutputColumnOnCallTableColumn,
        operator: FilterStructuredOutputColumnOnCallTableOperator,
        value: [String: JSONValue],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.column = column
        self.operator = `operator`
        self.value = value
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.column = try container.decode(FilterStructuredOutputColumnOnCallTableColumn.self, forKey: .column)
        self.operator = try container.decode(FilterStructuredOutputColumnOnCallTableOperator.self, forKey: .operator)
        self.value = try container.decode([String: JSONValue].self, forKey: .value)
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