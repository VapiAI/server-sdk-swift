import Foundation

public struct AnalyticsQuery: Codable, Hashable, Sendable {
    /// This is the table you want to query.
    public let table: AnalyticsQueryTable
    /// This is the list of columns you want to group by.
    public let groupBy: [AnalyticsQueryGroupByItem]?
    /// This is the list of variable value keys you want to group by.
    public let groupByVariableValue: [VariableValueGroupBy]?
    /// This is the name of the query. This will be used to identify the query in the response.
    public let name: String
    /// This is the time range for the query.
    public let timeRange: TimeRange?
    /// This is the list of operations you want to perform.
    public let operations: [AnalyticsOperation]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        table: AnalyticsQueryTable,
        groupBy: [AnalyticsQueryGroupByItem]? = nil,
        groupByVariableValue: [VariableValueGroupBy]? = nil,
        name: String,
        timeRange: TimeRange? = nil,
        operations: [AnalyticsOperation],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.table = table
        self.groupBy = groupBy
        self.groupByVariableValue = groupByVariableValue
        self.name = name
        self.timeRange = timeRange
        self.operations = operations
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.table = try container.decode(AnalyticsQueryTable.self, forKey: .table)
        self.groupBy = try container.decodeIfPresent([AnalyticsQueryGroupByItem].self, forKey: .groupBy)
        self.groupByVariableValue = try container.decodeIfPresent([VariableValueGroupBy].self, forKey: .groupByVariableValue)
        self.name = try container.decode(String.self, forKey: .name)
        self.timeRange = try container.decodeIfPresent(TimeRange.self, forKey: .timeRange)
        self.operations = try container.decode([AnalyticsOperation].self, forKey: .operations)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.table, forKey: .table)
        try container.encodeIfPresent(self.groupBy, forKey: .groupBy)
        try container.encodeIfPresent(self.groupByVariableValue, forKey: .groupByVariableValue)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.timeRange, forKey: .timeRange)
        try container.encode(self.operations, forKey: .operations)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case table
        case groupBy
        case groupByVariableValue
        case name
        case timeRange
        case operations
    }
}