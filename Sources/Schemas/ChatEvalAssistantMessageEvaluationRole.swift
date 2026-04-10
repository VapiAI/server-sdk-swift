import Foundation

/// This is the role of the message author.
/// For an assistant message evaluation, the role is always 'assistant'
/// @default 'assistant'
public enum ChatEvalAssistantMessageEvaluationRole: String, Codable, Hashable, CaseIterable, Sendable {
    case assistant
}