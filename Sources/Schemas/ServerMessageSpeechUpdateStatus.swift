import Foundation

/// This is the status of the speech update.
public enum ServerMessageSpeechUpdateStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case started
    case stopped
}