import Foundation

/// Role associated with the conversation message.
public enum OpenAiMessageRole: String, Codable, Hashable, CaseIterable, Sendable {
    case assistant
    case function
    case user
    case system
    case tool
}