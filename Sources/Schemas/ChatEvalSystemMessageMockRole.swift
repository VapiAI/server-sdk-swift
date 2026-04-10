import Foundation

/// This is the role of the message author.
/// For a mock system message, the role is always 'system'
/// @default 'system'
public enum ChatEvalSystemMessageMockRole: String, Codable, Hashable, CaseIterable, Sendable {
    case system
}