import Foundation

public struct InsightFormula: Codable, Hashable, Sendable {
    /// This is the name of the formula.
    /// It will be used to label the formula in the insight board on the UI.
    public let name: String?
    /// This is the formula to calculate the insight from the queries.
    /// The formula needs to be a valid mathematical expression.
    /// The formula must contain at least one query name in the LiquidJS format {{query_name}} or {{['query name']}} which will be substituted with the query result.
    /// Any MathJS formula is allowed - https://mathjs.org/docs/expressions/syntax.html
    /// 
    /// Common valid math operations are +, -, *, /, %
    public let formula: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String? = nil,
        formula: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.formula = formula
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.formula = try container.decode(String.self, forKey: .formula)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(self.formula, forKey: .formula)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case formula
    }
}