import Foundation

/// This is the type of the Insight.
/// It is required to be `pie` to create a pie insight.
public enum PieInsightFromCallTableType: String, Codable, Hashable, CaseIterable, Sendable {
    case pie
}