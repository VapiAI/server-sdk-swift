import Foundation

/// This is the type of the message. "chat.deleted" is sent when a chat is deleted.
public enum ServerMessageChatDeletedType: String, Codable, Hashable, CaseIterable, Sendable {
    case chatDeleted = "chat.deleted"
}