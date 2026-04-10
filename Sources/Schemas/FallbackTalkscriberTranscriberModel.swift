import Foundation

/// This is the model that will be used for the transcription.
public enum FallbackTalkscriberTranscriberModel: String, Codable, Hashable, CaseIterable, Sendable {
    case whisper
}