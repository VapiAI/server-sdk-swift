import Foundation

/// This is the current status of the session. Can be either 'active' or 'completed'.
public enum SessionStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case completed
}