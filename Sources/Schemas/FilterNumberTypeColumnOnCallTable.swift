import Foundation

public struct FilterNumberTypeColumnOnCallTable: Codable, Hashable, Sendable {
    /// This is the column in the call table that will be filtered on.
    /// Number Type columns are columns where the rows store data as a number.
    /// Must be a valid column for the selected table.
    public let column: FilterNumberTypeColumnOnCallTableColumn
    /// This is the operator to use for the filter.
    /// For number type columns, the operator must be "=", ">", "<", ">=", "<="
    public let `operator`: FilterNumberTypeColumnOnCallTableOperator
    /// This is the value to filter on.
    public let value: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        column: FilterNumberTypeColumnOnCallTableColumn,
        operator: FilterNumberTypeColumnOnCallTableOperator,
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
        self.column = try container.decode(FilterNumberTypeColumnOnCallTableColumn.self, forKey: .column)
        self.operator = try container.decode(FilterNumberTypeColumnOnCallTableOperator.self, forKey: .operator)
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