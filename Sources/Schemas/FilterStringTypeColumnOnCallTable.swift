import Foundation

public struct FilterStringTypeColumnOnCallTable: Codable, Hashable, Sendable {
    /// This is the column in the call table that will be filtered on.
    /// String Type columns are columns where the rows store data as a string.
    /// Must be a valid column for the selected table.
    public let column: FilterStringTypeColumnOnCallTableColumn
    /// This is the operator to use for the filter.
    /// For string type columns, the operator must be "=", "!=", "contains", "not contains"
    public let `operator`: FilterStringTypeColumnOnCallTableOperator
    /// This is the value to filter on.
    public let value: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        column: FilterStringTypeColumnOnCallTableColumn,
        operator: FilterStringTypeColumnOnCallTableOperator,
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
        self.column = try container.decode(FilterStringTypeColumnOnCallTableColumn.self, forKey: .column)
        self.operator = try container.decode(FilterStringTypeColumnOnCallTableOperator.self, forKey: .operator)
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