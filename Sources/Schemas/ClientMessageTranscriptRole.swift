import Foundation

/// This is the role for which the transcript is for.
public enum ClientMessageTranscriptRole: String, Codable, Hashable, CaseIterable, Sendable {
    case assistant
    case user
}