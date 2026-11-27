import Foundation

/// This is the comparison made: the metric's value on the left, `expectedValue` on the right.
public enum TranscriptMetricEvaluationResultComparator: String, Codable, Hashable, CaseIterable, Sendable {
    case equalTo = "="
    case notEquals = "!="
    case greaterThan = ">"
    case lessThan = "<"
    case greaterThanOrEqualTo = ">="
    case lessThanOrEqualTo = "<="
}