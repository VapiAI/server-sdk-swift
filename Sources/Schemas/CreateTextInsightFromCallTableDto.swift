import Foundation

public struct CreateTextInsightFromCallTableDto: Codable, Hashable, Sendable {
    /// This is the name of the Insight.
    public let name: String?
    /// Formulas are mathematical expressions applied on the data returned by the queries to transform them before being used to create the insight.
    /// The formulas needs to be a valid mathematical expression, supported by MathJS - https://mathjs.org/docs/expressions/syntax.html
    /// A formula is created by using the query names as the variable.
    /// The formulas must contain at least one query name in the LiquidJS format {{query_name}} or {{['query name']}} which will be substituted with the query result.
    /// For example, if you have 2 queries, 'Was Booking Made' and 'Average Call Duration', you can create a formula like this:
    /// ```
    /// {{['Query 1']}} / {{['Query 2']}} * 100
    /// ```
    /// 
    /// ```
    /// ({{[Query 1]}} * 10) + {{[Query 2]}}
    /// ```
    /// This will take the
    /// 
    /// You can also use the query names as the variable in the formula.
    public let formula: [String: JSONValue]?
    public let timeRange: InsightTimeRange?
    /// These are the queries to run to generate the insight.
    /// For Text Insights, we only allow a single query, or require a formula if multiple queries are provided
    public let queries: [CreateTextInsightFromCallTableDtoQueriesItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String? = nil,
        formula: [String: JSONValue]? = nil,
        timeRange: InsightTimeRange? = nil,
        queries: [CreateTextInsightFromCallTableDtoQueriesItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.formula = formula
        self.timeRange = timeRange
        self.queries = queries
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.formula = try container.decodeIfPresent([String: JSONValue].self, forKey: .formula)
        self.timeRange = try container.decodeIfPresent(InsightTimeRange.self, forKey: .timeRange)
        self.queries = try container.decode([CreateTextInsightFromCallTableDtoQueriesItem].self, forKey: .queries)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.formula, forKey: .formula)
        try container.encodeIfPresent(self.timeRange, forKey: .timeRange)
        try container.encode(self.queries, forKey: .queries)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case formula
        case timeRange
        case queries
    }
}