import Foundation

/// This is the table that will be queried.
/// Must be "events" for event-based insights.
public enum JsonQueryOnEventsTableTable: String, Codable, Hashable, CaseIterable, Sendable {
    case events
}