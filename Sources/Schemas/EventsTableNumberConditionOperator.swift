import Foundation

/// Number comparison operator
public enum EventsTableNumberConditionOperator: String, Codable, Hashable, CaseIterable, Sendable {
    case equalTo = "="
    case notEquals = "!="
    case greaterThan = ">"
    case greaterThanOrEqualTo = ">="
    case lessThan = "<"
    case lessThanOrEqualTo = "<="
}