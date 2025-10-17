import Foundation

/// This is the aggregation operation you want to perform.
public enum AnalyticsOperationOperation: String, Codable, Hashable, CaseIterable, Sendable {
    case sum
    case avg
    case count
    case min
    case max
    case history
}