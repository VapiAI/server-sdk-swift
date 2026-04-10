import Foundation

/// Event type
public enum ResponseTextDeltaEventType: String, Codable, Hashable, CaseIterable, Sendable {
    case responseOutputTextDelta = "response.output_text.delta"
}