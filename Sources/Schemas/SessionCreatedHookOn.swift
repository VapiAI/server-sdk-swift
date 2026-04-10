import Foundation

/// This is the event that triggers this hook
public enum SessionCreatedHookOn: String, Codable, Hashable, CaseIterable, Sendable {
    case sessionCreated = "session.created"
}