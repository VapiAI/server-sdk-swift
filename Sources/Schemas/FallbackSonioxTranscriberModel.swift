import Foundation

/// The Soniox model to use for transcription.
public enum FallbackSonioxTranscriberModel: String, Codable, Hashable, CaseIterable, Sendable {
    case sttRtV4 = "stt-rt-v4"
}