import Foundation

public struct JsonQueryOnCallTableWithNumberTypeColumn: Codable, Hashable, Sendable {
    /// This is the type of query. Only allowed type is "vapiql-json".
    public let type: JsonQueryOnCallTableWithNumberTypeColumnType
    /// This is the table that will be queried.
    public let table: JsonQueryOnCallTableWithNumberTypeColumnTable
    /// This is the filters to apply to the insight.
    /// The discriminator automatically selects the correct filter type based on column and operator.
    public let filters: [JsonQueryOnCallTableWithNumberTypeColumnFiltersItem]?
    /// This is the column that will be queried in the selected table.
    /// Available columns depend on the selected table.
    /// Number Type columns are columns where the rows store Number data
    public let column: JsonQueryOnCallTableWithNumberTypeColumnColumn
    /// This is the aggregation operation to perform on the column.
    /// When the column is a number type, the operation must be one of the following:
    /// - average
    /// - sum
    /// - min
    /// - max
    public let operation: JsonQueryOnCallTableWithNumberTypeColumnOperation
    /// This is the name of the query.
    /// It will be used to label the query in the insight board on the UI.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: JsonQueryOnCallTableWithNumberTypeColumnType,
        table: JsonQueryOnCallTableWithNumberTypeColumnTable,
        filters: [JsonQueryOnCallTableWithNumberTypeColumnFiltersItem]? = nil,
        column: JsonQueryOnCallTableWithNumberTypeColumnColumn,
        operation: JsonQueryOnCallTableWithNumberTypeColumnOperation,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.table = table
        self.filters = filters
        self.column = column
        self.operation = operation
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(JsonQueryOnCallTableWithNumberTypeColumnType.self, forKey: .type)
        self.table = try container.decode(JsonQueryOnCallTableWithNumberTypeColumnTable.self, forKey: .table)
        self.filters = try container.decodeIfPresent([JsonQueryOnCallTableWithNumberTypeColumnFiltersItem].self, forKey: .filters)
        self.column = try container.decode(JsonQueryOnCallTableWithNumberTypeColumnColumn.self, forKey: .column)
        self.operation = try container.decode(JsonQueryOnCallTableWithNumberTypeColumnOperation.self, forKey: .operation)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.table, forKey: .table)
        try container.encodeIfPresent(self.filters, forKey: .filters)
        try container.encode(self.column, forKey: .column)
        try container.encode(self.operation, forKey: .operation)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case table
        case filters
        case column
        case operation
        case name
    }
}