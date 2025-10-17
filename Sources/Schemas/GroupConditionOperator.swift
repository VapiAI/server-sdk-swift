import Foundation

/// This is the logical operator for combining conditions in this group
public enum GroupConditionOperator: String, Codable, Hashable, CaseIterable, Sendable {
    case and = "AND"
    case or = "OR"
}