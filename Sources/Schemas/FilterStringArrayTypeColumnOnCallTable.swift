import Foundation

public struct FilterStringArrayTypeColumnOnCallTable: Codable, Hashable, Sendable {
    /// This is the column in the call table that will be filtered on.
    /// String Array Type columns are the same as String Type columns, but provides the ability to filter on multiple values provided as an array.
    /// Must be a valid column for the selected table.
    public let column: FilterStringArrayTypeColumnOnCallTableColumn
    /// This is the operator to use for the filter.
    /// The operator must be `in` or `not_in`.
    public let `operator`: FilterStringArrayTypeColumnOnCallTableOperator
    /// These are the values to filter on.
    public let value: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        column: FilterStringArrayTypeColumnOnCallTableColumn,
        operator: FilterStringArrayTypeColumnOnCallTableOperator,
        value: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.column = column
        self.operator = `operator`
        self.value = value
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.column = try container.decode(FilterStringArrayTypeColumnOnCallTableColumn.self, forKey: .column)
        self.operator = try container.decode(FilterStringArrayTypeColumnOnCallTableOperator.self, forKey: .operator)
        self.value = try container.decode([String].self, forKey: .value)
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