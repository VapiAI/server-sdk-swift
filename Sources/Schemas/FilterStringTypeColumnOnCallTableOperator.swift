import Foundation

/// This is the operator to use for the filter.
/// For string type columns, the operator must be "=", "!=", "contains", "not contains"
public enum FilterStringTypeColumnOnCallTableOperator: String, Codable, Hashable, CaseIterable, Sendable {
    case equalTo = "="
    case notEquals = "!="
    case contains
    case notContains = "not_contains"
}