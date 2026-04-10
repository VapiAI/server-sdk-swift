import Foundation

/// This is the role of the message author.
/// For a mock assistant message, the role is always 'assistant'
/// @default 'assistant'
public enum ChatEvalAssistantMessageMockRole: String, Codable, Hashable, CaseIterable, Sendable {
    case assistant
}