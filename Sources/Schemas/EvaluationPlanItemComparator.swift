import Foundation

/// How the structured output value is compared against `value`. Available operators depend on the output type. Boolean and string support `=` and `!=`; number and integer support `=`, `!=`, `>`, `<`, `>=`, `<=`.
public enum EvaluationPlanItemComparator: String, Codable, Hashable, CaseIterable, Sendable {
    case equalTo = "="
    case notEquals = "!="
    case greaterThan = ">"
    case lessThan = "<"
    case greaterThanOrEqualTo = ">="
    case lessThanOrEqualTo = "<="
}