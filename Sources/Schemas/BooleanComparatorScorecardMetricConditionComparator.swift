import Foundation

/// The comparator can only be '=' for boolean conditions.
public enum BooleanComparatorScorecardMetricConditionComparator: String, Codable, Hashable, CaseIterable, Sendable {
    case equalTo = "="
}