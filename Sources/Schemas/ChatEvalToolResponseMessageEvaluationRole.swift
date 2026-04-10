import Foundation

/// This is the role of the message author.
/// For a tool response message evaluation, the role is always 'tool'
/// @default 'tool'
public enum ChatEvalToolResponseMessageEvaluationRole: String, Codable, Hashable, CaseIterable, Sendable {
    case tool
}