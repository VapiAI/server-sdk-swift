import Foundation

public struct JsonQueryOnCallTableWithStructuredOutputColumn: Codable, Hashable, Sendable {
    /// This is the type of query. Only allowed type is "vapiql-json".
    public let type: JsonQueryOnCallTableWithStructuredOutputColumnType
    /// This is the table that will be queried.
    public let table: JsonQueryOnCallTableWithStructuredOutputColumnTable
    /// This is the filters to apply to the insight.
    /// The discriminator automatically selects the correct filter type based on column and operator.
    public let filters: [JsonQueryOnCallTableWithStructuredOutputColumnFiltersItem]?
    /// This is the column that will be queried in the call table.
    /// Structured Output Type columns are only to query on artifact.structuredOutputs[OutputID] column.
    public let column: JsonQueryOnCallTableWithStructuredOutputColumnColumn
    /// This is the aggregation operation to perform on the column.
    /// When the column is a structured output type, the operation depends on the value of the structured output.
    /// If the structured output is a string or boolean, the operation must be "count".
    /// If the structured output is a number, the operation can be "average", "sum", "min", or "max".
    public let operation: JsonQueryOnCallTableWithStructuredOutputColumnOperation
    /// This is the name of the query.
    /// It will be used to label the query in the insight board on the UI.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: JsonQueryOnCallTableWithStructuredOutputColumnType,
        table: JsonQueryOnCallTableWithStructuredOutputColumnTable,
        filters: [JsonQueryOnCallTableWithStructuredOutputColumnFiltersItem]? = nil,
        column: JsonQueryOnCallTableWithStructuredOutputColumnColumn,
        operation: JsonQueryOnCallTableWithStructuredOutputColumnOperation,
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
        self.type = try container.decode(JsonQueryOnCallTableWithStructuredOutputColumnType.self, forKey: .type)
        self.table = try container.decode(JsonQueryOnCallTableWithStructuredOutputColumnTable.self, forKey: .table)
        self.filters = try container.decodeIfPresent([JsonQueryOnCallTableWithStructuredOutputColumnFiltersItem].self, forKey: .filters)
        self.column = try container.decode(JsonQueryOnCallTableWithStructuredOutputColumnColumn.self, forKey: .column)
        self.operation = try container.decode(JsonQueryOnCallTableWithStructuredOutputColumnOperation.self, forKey: .operation)
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