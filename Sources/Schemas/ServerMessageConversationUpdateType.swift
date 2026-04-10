import Foundation

/// This is the type of the message. "conversation-update" is sent when an update is committed to the conversation history.
public enum ServerMessageConversationUpdateType: String, Codable, Hashable, CaseIterable, Sendable {
    case conversationUpdate = "conversation-update"
}