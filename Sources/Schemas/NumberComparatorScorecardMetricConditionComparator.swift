import Foundation

/// This is the comparator that will be used to compare the result of the structured output with the value specified.
/// Only '=', '!=', '>', '<', '>=', and '<=' are supported for number conditions
/// Only '=' is supported for boolean conditions.
public enum NumberComparatorScorecardMetricConditionComparator: String, Codable, Hashable, CaseIterable, Sendable {
    case equalTo = "="
    case notEquals = "!="
    case greaterThan = ">"
    case lessThan = "<"
    case greaterThanOrEqualTo = ">="
    case lessThanOrEqualTo = "<="
}