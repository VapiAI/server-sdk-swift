import Foundation

/// This is the type of the Insight.
/// It is required to be `text` to create a text insight.
public enum TextInsightFromCallTableType: String, Codable, Hashable, CaseIterable, Sendable {
    case text
}