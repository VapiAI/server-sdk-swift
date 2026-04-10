import Foundation

/// Event type
public enum ResponseTextDoneEventType: String, Codable, Hashable, CaseIterable, Sendable {
    case responseOutputTextDone = "response.output_text.done"
}