import Foundation

/// This is the SIP method to send (sip-request tool).
public enum UpdateToolDraftDtoVerb: String, Codable, Hashable, CaseIterable, Sendable {
    case info = "INFO"
    case message = "MESSAGE"
    case notify = "NOTIFY"
}