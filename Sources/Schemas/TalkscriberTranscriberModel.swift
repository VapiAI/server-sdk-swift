import Foundation

/// This is the model that will be used for the transcription.
public enum TalkscriberTranscriberModel: String, Codable, Hashable, CaseIterable, Sendable {
    case whisper
}