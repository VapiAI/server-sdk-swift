import Foundation

/// This is the type of the eval.
/// Currently it is fixed to `chat.mockConversation`.
public enum UpdateEvalDtoType: String, Codable, Hashable, CaseIterable, Sendable {
    case chatMockConversation = "chat.mockConversation"
}