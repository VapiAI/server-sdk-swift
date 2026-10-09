import Foundation

/// This is the audio format of the call.
/// 
/// @default 'pcm_s16le'
public enum AudioFormatFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case pcmS16Le = "pcm_s16le"
    case mulaw
}