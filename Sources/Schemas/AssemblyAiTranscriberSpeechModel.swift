import Foundation

/// This is the speech model used for the streaming session.
/// Keyterms prompting is supported on universal-streaming-english, universal-3-5-pro and universal-3-6-pro.
/// universal-3-6-pro is AssemblyAI's newest and most accurate voice-agent model.
/// @default 'universal-streaming-english'
public enum AssemblyAiTranscriberSpeechModel: String, Codable, Hashable, CaseIterable, Sendable {
    case universalStreamingEnglish = "universal-streaming-english"
    case universalStreamingMultilingual = "universal-streaming-multilingual"
    case universal35Pro = "universal-3-5-pro"
    case universal36Pro = "universal-3-6-pro"
}