import Foundation

public struct FilterDateTypeColumnOnCallTable: Codable, Hashable, Sendable {
    /// This is the column in the call table that will be filtered on.
    /// Date Type columns are columns where the rows store data as a date.
    /// Must be a valid column for the selected table.
    public let column: FilterDateTypeColumnOnCallTableColumn
    /// This is the operator to use for the filter.
    /// For date type columns, the operator must be "=", ">", "<", ">=", "<="
    public let `operator`: FilterDateTypeColumnOnCallTableOperator
    /// This is the value to filter on.
    /// Must be a valid ISO 8601 date-time string.
    public let value: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        column: FilterDateTypeColumnOnCallTableColumn,
        operator: FilterDateTypeColumnOnCallTableOperator,
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
        self.column = try container.decode(FilterDateTypeColumnOnCallTableColumn.self, forKey: .column)
        self.operator = try container.decode(FilterDateTypeColumnOnCallTableOperator.self, forKey: .operator)
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