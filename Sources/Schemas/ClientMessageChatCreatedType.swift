import Foundation

/// This is the type of the message. "chat.created" is sent when a new chat is created.
public enum ClientMessageChatCreatedType: String, Codable, Hashable, CaseIterable, Sendable {
    case chatCreated = "chat.created"
}