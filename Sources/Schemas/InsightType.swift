import Foundation

/// This is the type of the Insight.
public enum InsightType: String, Codable, Hashable, CaseIterable, Sendable {
    case bar
    case line
    case pie
    case text
}