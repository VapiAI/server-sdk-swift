import Foundation

/// This is the type of the eval.
/// Currently it is fixed to `chat.mockConversation`.
public enum CreateEvalDtoType: String, Codable, Hashable, CaseIterable, Sendable {
    case chatMockConversation = "chat.mockConversation"
}