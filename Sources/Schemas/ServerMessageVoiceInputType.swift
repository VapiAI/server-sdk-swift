import Foundation

/// This is the type of the message. "voice-input" is sent when a generation is requested from voice provider.
public enum ServerMessageVoiceInputType: String, Codable, Hashable, CaseIterable, Sendable {
    case voiceInput = "voice-input"
}