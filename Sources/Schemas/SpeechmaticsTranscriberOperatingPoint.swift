import Foundation

/// This is the operating point for the transcription. Choose between `standard` for faster turnaround with strong accuracy or `enhanced` for highest accuracy when precision is critical.
/// 
/// @default 'enhanced'
public enum SpeechmaticsTranscriberOperatingPoint: String, Codable, Hashable, CaseIterable, Sendable {
    case standard
    case enhanced
}