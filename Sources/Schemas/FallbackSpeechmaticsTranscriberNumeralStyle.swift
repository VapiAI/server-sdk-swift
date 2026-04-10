import Foundation

/// This controls how numbers, dates, currencies, and other entities are formatted in the transcription output.
/// 
/// @default 'written'
public enum FallbackSpeechmaticsTranscriberNumeralStyle: String, Codable, Hashable, CaseIterable, Sendable {
    case written
    case spoken
}