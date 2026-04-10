import Foundation

/// This is the role of the message author.
/// For a mock tool response message, the role is always 'tool'
/// @default 'tool'
public enum ChatEvalToolResponseMessageMockRole: String, Codable, Hashable, CaseIterable, Sendable {
    case tool
}