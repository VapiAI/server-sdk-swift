import Foundation

/// The terminal status of the transfer, rendered as the status line.
public enum TransferArtifactStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case connected
    case noAnswer = "no-answer"
    case busy
    case voicemail
    case failed
    case completed
    case cancelled
}