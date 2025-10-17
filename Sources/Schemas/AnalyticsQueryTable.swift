import Foundation

/// This is the table you want to query.
public enum AnalyticsQueryTable: String, Codable, Hashable, CaseIterable, Sendable {
    case call
    case subscription
}