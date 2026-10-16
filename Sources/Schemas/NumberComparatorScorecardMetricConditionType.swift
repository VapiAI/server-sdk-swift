import Foundation

/// This is the type of the condition. Currently only 'comparator' is supported.
public enum NumberComparatorScorecardMetricConditionType: String, Codable, Hashable, CaseIterable, Sendable {
    case comparator
}