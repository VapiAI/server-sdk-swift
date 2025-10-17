import Foundation

/// This controls how numbers are formatted in the transcription output.
/// 
/// @default 'written'
public enum FallbackSpeechmaticsTranscriberNumeralStyle: String, Codable, Hashable, CaseIterable, Sendable {
    case written
    case spoken
}