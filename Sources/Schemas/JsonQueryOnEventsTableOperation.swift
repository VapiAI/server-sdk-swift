import Foundation

/// This is the operation to perform on matching events.
/// - "count": Returns the raw count of matching events
/// - "percentage": Returns (count of matching events / total calls) * 100
public enum JsonQueryOnEventsTableOperation: String, Codable, Hashable, CaseIterable, Sendable {
    case count
    case percentage
}