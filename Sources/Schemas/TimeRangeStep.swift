import Foundation

/// This is the time step for aggregations.
/// 
/// If not provided, defaults to returning for the entire time range.
public enum TimeRangeStep: String, Codable, Hashable, CaseIterable, Sendable {
    case second
    case minute
    case hour
    case day
    case week
    case month
    case quarter
    case year
    case decade
    case century
    case millennium
}