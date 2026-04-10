import Foundation

/// This is the operator to use for the filter.
/// The operator must be `in` or `not_in`.
public enum FilterNumberArrayTypeColumnOnCallTableOperator: String, Codable, Hashable, CaseIterable, Sendable {
    case `in`
    case notIn = "not_in"
    case isEmpty = "is_empty"
    case isNotEmpty = "is_not_empty"
}