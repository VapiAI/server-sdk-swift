import Foundation

/// This is the type of the message. "assistant-speech" is sent as assistant audio is being played.
public enum ServerMessageAssistantSpeechType: String, Codable, Hashable, CaseIterable, Sendable {
    case assistantSpeechStarted = "assistant.speechStarted"
}