import Foundation

/// This is the group by step for aggregation.
/// 
/// If not provided, defaults to group by day.
public enum InsightTimeRangeWithStepStep: String, Codable, Hashable, CaseIterable, Sendable {
    case minute
    case hour
    case day
    case week
    case month
    case quarter
    case year
}