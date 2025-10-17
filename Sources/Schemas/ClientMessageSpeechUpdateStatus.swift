import Foundation

/// This is the status of the speech update.
public enum ClientMessageSpeechUpdateStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case started
    case stopped
}