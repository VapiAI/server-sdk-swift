import Foundation

/// This is the model that will be used for text-to-speech.
public enum FallbackOpenAiVoiceModel: String, Codable, Hashable, CaseIterable, Sendable {
    case tts1 = "tts-1"
    case tts1Hd = "tts-1-hd"
    case gpt4OMiniTts = "gpt-4o-mini-tts"
}