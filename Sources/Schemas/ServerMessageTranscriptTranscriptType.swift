import Foundation

/// This is the type of the transcript.
public enum ServerMessageTranscriptTranscriptType: String, Codable, Hashable, CaseIterable, Sendable {
    case partial
    case final
}