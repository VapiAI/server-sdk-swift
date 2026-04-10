import Foundation

/// String comparison operator
public enum EventsTableStringConditionOperator: String, Codable, Hashable, CaseIterable, Sendable {
    case equalTo = "="
    case notEquals = "!="
    case contains
    case notContains
}