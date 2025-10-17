import Foundation

public struct AnalyticsOperation: Codable, Hashable, Sendable {
    /// This is the aggregation operation you want to perform.
    public let operation: AnalyticsOperationOperation
    /// This is the columns you want to perform the aggregation operation on.
    public let column: AnalyticsOperationColumn
    /// This is the alias for column name returned. Defaults to `${operation}${column}`.
    public let alias: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        operation: AnalyticsOperationOperation,
        column: AnalyticsOperationColumn,
        alias: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.operation = operation
        self.column = column
        self.alias = alias
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.operation = try container.decode(AnalyticsOperationOperation.self, forKey: .operation)
        self.column = try container.decode(AnalyticsOperationColumn.self, forKey: .column)
        self.alias = try container.decodeIfPresent(String.self, forKey: .alias)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.operation, forKey: .operation)
        try container.encode(self.column, forKey: .column)
        try container.encodeIfPresent(self.alias, forKey: .alias)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case operation
        case column
        case alias
    }
}