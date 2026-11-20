import Foundation

/// Machine-readable cause; clients branch on this, never on `message`.
public enum GuardrailRuleConflictResponseDtoError: String, Codable, Hashable, CaseIterable, Sendable {
    case ruleChanged = "rule_changed"
    case impactChanged = "impact_changed"
    case globalAssignment = "global_assignment"
}