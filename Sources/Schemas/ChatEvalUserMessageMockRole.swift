import Foundation

/// This is the role of the message author.
/// For a mock user message, the role is always 'user'
/// @default 'user'
public enum ChatEvalUserMessageMockRole: String, Codable, Hashable, CaseIterable, Sendable {
    case user
}