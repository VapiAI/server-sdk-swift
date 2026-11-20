import Foundation

/// This is the type of the condition. Currently only 'comparator' is supported.
public enum BooleanComparatorScorecardMetricConditionType: String, Codable, Hashable, CaseIterable, Sendable {
    case comparator
}