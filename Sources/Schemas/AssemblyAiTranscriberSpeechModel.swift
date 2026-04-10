import Foundation

/// This is the speech model used for the streaming session.
/// Note: Keyterms prompting is not supported with multilingual streaming.
/// @default 'universal-streaming-english'
public enum AssemblyAiTranscriberSpeechModel: String, Codable, Hashable, CaseIterable, Sendable {
    case universalStreamingEnglish = "universal-streaming-english"
    case universalStreamingMultilingual = "universal-streaming-multilingual"
}