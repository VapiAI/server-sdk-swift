import Foundation

/// This is the type of the message. "speech-update" is sent whenever assistant or user start or stop speaking.
public enum ClientMessageSpeechUpdateType: String, Codable, Hashable, CaseIterable, Sendable {
    case speechUpdate = "speech-update"
}