import Foundation

/// This is the type of the Insight.
/// It is required to be `line` to create a line insight.
public enum LineInsightFromCallTableType: String, Codable, Hashable, CaseIterable, Sendable {
    case line
}