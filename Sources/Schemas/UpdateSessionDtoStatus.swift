import Foundation

/// This is the new status for the session.
public enum UpdateSessionDtoStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case completed
}