import Foundation

/// This is the operator you want to use to compare the parameter and value.
public enum ConditionOperator: String, Codable, Hashable, CaseIterable, Sendable {
    case eq
    case neq
    case gt
    case gte
    case lt
    case lte
}