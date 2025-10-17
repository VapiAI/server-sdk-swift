import Foundation

/// This is the role which the speech update is for.
public enum ClientMessageSpeechUpdateRole: String, Codable, Hashable, CaseIterable, Sendable {
    case assistant
    case user
}