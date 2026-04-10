import Foundation

/// This is the operator to use for the filter.
/// For number type columns, the operator must be "=", ">", "<", ">=", "<="
public enum FilterNumberTypeColumnOnCallTableOperator: String, Codable, Hashable, CaseIterable, Sendable {
    case equalTo = "="
    case notEquals = "!="
    case greaterThan = ">"
    case lessThan = "<"
    case greaterThanOrEqualTo = ">="
    case lessThanOrEqualTo = "<="
}