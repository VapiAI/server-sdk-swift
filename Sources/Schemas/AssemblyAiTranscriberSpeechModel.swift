import Foundation

/// This is the speech model used for the streaming session.
/// Keyterms prompting is supported on universal-streaming-english and universal-3-5-pro.
/// universal-3-5-pro is AssemblyAI's most accurate voice-agent model.
/// @default 'universal-streaming-english'
public enum AssemblyAiTranscriberSpeechModel: String, Codable, Hashable, CaseIterable, Sendable {
    case universalStreamingEnglish = "universal-streaming-english"
    case universalStreamingMultilingual = "universal-streaming-multilingual"
    case universal35Pro = "universal-3-5-pro"
}