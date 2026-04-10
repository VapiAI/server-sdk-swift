import Foundation

/// Indicates how the text was sourced.
public enum ServerMessageAssistantSpeechSource: String, Codable, Hashable, CaseIterable, Sendable {
    case model
    case forceSay = "force-say"
    case customVoice = "custom-voice"
}