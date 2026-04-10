import Foundation

public struct UpdateLineInsightFromCallTableDto: Codable, Hashable, Sendable {
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
    public let formulas: [InsightFormula]?
    /// This is the metadata for the insight.
    public let metadata: LineInsightMetadata?
    public let timeRange: InsightTimeRangeWithStep?
    /// This is the group by column for the insight when table is `call`.
    /// These are the columns to group the results by.
    /// All results are grouped by the time range step by default.
    public let groupBy: UpdateLineInsightFromCallTableDtoGroupBy?
    /// These are the queries to run to generate the insight.
    public let queries: [UpdateLineInsightFromCallTableDtoQueriesItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String? = nil,
        formulas: [InsightFormula]? = nil,
        metadata: LineInsightMetadata? = nil,
        timeRange: InsightTimeRangeWithStep? = nil,
        groupBy: UpdateLineInsightFromCallTableDtoGroupBy? = nil,
        queries: [UpdateLineInsightFromCallTableDtoQueriesItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.formulas = formulas
        self.metadata = metadata
        self.timeRange = timeRange
        self.groupBy = groupBy
        self.queries = queries
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.formulas = try container.decodeIfPresent([InsightFormula].self, forKey: .formulas)
        self.metadata = try container.decodeIfPresent(LineInsightMetadata.self, forKey: .metadata)
        self.timeRange = try container.decodeIfPresent(InsightTimeRangeWithStep.self, forKey: .timeRange)
        self.groupBy = try container.decodeIfPresent(UpdateLineInsightFromCallTableDtoGroupBy.self, forKey: .groupBy)
        self.queries = try container.decodeIfPresent([UpdateLineInsightFromCallTableDtoQueriesItem].self, forKey: .queries)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.formulas, forKey: .formulas)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
        try container.encodeIfPresent(self.timeRange, forKey: .timeRange)
        try container.encodeIfPresent(self.groupBy, forKey: .groupBy)
        try container.encodeIfPresent(self.queries, forKey: .queries)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case formulas
        case metadata
        case timeRange
        case groupBy
        case queries
    }
}