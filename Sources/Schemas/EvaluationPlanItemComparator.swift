import Foundation

/// This is the comparison operator to use when evaluating the extracted value against the expected value.
/// Available operators depend on the structured output's schema type:
/// - boolean: '=', '!='
/// - string: '=', '!='
/// - number/integer: '=', '!=', '>', '<', '>=', '<='
public enum EvaluationPlanItemComparator: String, Codable, Hashable, CaseIterable, Sendable {
    case equalTo = "="
    case notEquals = "!="
    case greaterThan = ">"
    case lessThan = "<"
    case greaterThanOrEqualTo = ">="
    case lessThanOrEqualTo = "<="
}