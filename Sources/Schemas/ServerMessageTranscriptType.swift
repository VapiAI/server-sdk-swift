import Foundation

/// This is the type of the message. "transcript" is sent as transcriber outputs partial or final transcript.
public enum ServerMessageTranscriptType: String, Codable, Hashable, CaseIterable, Sendable {
    case transcript
    case transcriptTranscriptTypeFinal = "transcript[transcriptType=\"final\"]"
}