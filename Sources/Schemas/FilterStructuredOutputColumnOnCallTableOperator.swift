import Foundation

/// This is the operator to use for the filter.
/// The operator depends on the value type of the structured output.
/// If the structured output is a string or boolean, the operator must be "=", "!="
/// If the structured output is a number, the operator must be "=", ">", "<", ">=", "<="
/// If the structured output is an array, the operator must be "in" or "not_in"
public enum FilterStructuredOutputColumnOnCallTableOperator: String, Codable, Hashable, CaseIterable, Sendable {
    case equalTo = "="
    case notEquals = "!="
    case greaterThan = ">"
    case lessThan = "<"
    case greaterThanOrEqualTo = ">="
    case lessThanOrEqualTo = "<="
    case `in`
    case notIn = "not_in"
    case contains
    case notContains = "not_contains"
    case isEmpty = "is_empty"
    case isNotEmpty = "is_not_empty"
}