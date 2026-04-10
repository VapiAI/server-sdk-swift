import Foundation

public struct JsonQueryOnEventsTable: Codable, Hashable, Sendable {
    /// This is the type of query. Only allowed type is "vapiql-json".
    public let type: JsonQueryOnEventsTableType
    /// This is the table that will be queried.
    /// Must be "events" for event-based insights.
    public let table: JsonQueryOnEventsTableTable
    /// The event type to query
    public let on: JsonQueryOnEventsTableOn
    /// This is the operation to perform on matching events.
    /// - "count": Returns the raw count of matching events
    /// - "percentage": Returns (count of matching events / total calls) * 100
    public let operation: JsonQueryOnEventsTableOperation
    /// These are the filters to apply to the events query.
    /// Each filter filters on a field specific to the event type.
    public let filters: [JsonQueryOnEventsTableFiltersItem]?
    /// This is the name of the query.
    /// It will be used to label the query in the insight board on the UI.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: JsonQueryOnEventsTableType,
        table: JsonQueryOnEventsTableTable,
        on: JsonQueryOnEventsTableOn,
        operation: JsonQueryOnEventsTableOperation,
        filters: [JsonQueryOnEventsTableFiltersItem]? = nil,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.table = table
        self.on = on
        self.operation = operation
        self.filters = filters
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(JsonQueryOnEventsTableType.self, forKey: .type)
        self.table = try container.decode(JsonQueryOnEventsTableTable.self, forKey: .table)
        self.on = try container.decode(JsonQueryOnEventsTableOn.self, forKey: .on)
        self.operation = try container.decode(JsonQueryOnEventsTableOperation.self, forKey: .operation)
        self.filters = try container.decodeIfPresent([JsonQueryOnEventsTableFiltersItem].self, forKey: .filters)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.table, forKey: .table)
        try container.encode(self.on, forKey: .on)
        try container.encode(self.operation, forKey: .operation)
        try container.encodeIfPresent(self.filters, forKey: .filters)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case table
        case on
        case operation
        case filters
        case name
    }
}