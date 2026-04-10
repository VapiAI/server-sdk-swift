import Foundation

/// The SIP method to send.
public enum CreateSipRequestToolDtoVerb: String, Codable, Hashable, CaseIterable, Sendable {
    case info = "INFO"
    case message = "MESSAGE"
    case notify = "NOTIFY"
}