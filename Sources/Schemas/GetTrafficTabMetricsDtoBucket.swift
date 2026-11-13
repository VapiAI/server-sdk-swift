import Foundation

/// Bucket size for the timeseries. Defaults to 'day'.
public enum GetTrafficTabMetricsDtoBucket: String, Codable, Hashable, CaseIterable, Sendable {
    case hour
    case day
}