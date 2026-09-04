import Foundation

/// The Cartesia speech-to-text model used for transcription.
public enum CartesiaTranscriberModel: String, Codable, Hashable, CaseIterable, Sendable {
    case inkWhisper = "ink-whisper"
    case ink2 = "ink-2"
}