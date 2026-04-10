import Foundation

public struct PieInsightFromCallTable: Codable, Hashable, Sendable {
    /// This is the name of the Insight.
    public let name: String?
    /// This is the type of the Insight.
    /// It is required to be `pie` to create a pie insight.
    public let type: PieInsightFromCallTableType
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
    public let formulas: [InsightFormula]?
    public let timeRange: InsightTimeRange?
    /// This is the group by column for the insight when table is `call`.
    /// These are the columns to group the results by.
    /// All results are grouped by the time range step by default.
    public let groupBy: PieInsightFromCallTableGroupBy?
    /// These are the queries to run to generate the insight.
    public let queries: [PieInsightFromCallTableQueriesItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String? = nil,
        type: PieInsightFromCallTableType,
        formulas: [InsightFormula]? = nil,
        timeRange: InsightTimeRange? = nil,
        groupBy: PieInsightFromCallTableGroupBy? = nil,
        queries: [PieInsightFromCallTableQueriesItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.type = type
        self.formulas = formulas
        self.timeRange = timeRange
        self.groupBy = groupBy
        self.queries = queries
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.type = try container.decode(PieInsightFromCallTableType.self, forKey: .type)
        self.formulas = try container.decodeIfPresent([InsightFormula].self, forKey: .formulas)
        self.timeRange = try container.decodeIfPresent(InsightTimeRange.self, forKey: .timeRange)
        self.groupBy = try container.decodeIfPresent(PieInsightFromCallTableGroupBy.self, forKey: .groupBy)
        self.queries = try container.decode([PieInsightFromCallTableQueriesItem].self, forKey: .queries)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(self.type, forKey: .type)
        try container.encodeIfPresent(self.formulas, forKey: .formulas)
        try container.encodeIfPresent(self.timeRange, forKey: .timeRange)
        try container.encodeIfPresent(self.groupBy, forKey: .groupBy)
        try container.encode(self.queries, forKey: .queries)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case type
        case formulas
        case timeRange
        case groupBy
        case queries
    }
}