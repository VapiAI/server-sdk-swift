import Foundation

/// This is the SIP verb to use. Must be one of INFO, MESSAGE, or NOTIFY.
public enum VapiSipTransportMessageSipVerb: String, Codable, Hashable, CaseIterable, Sendable {
    case info = "INFO"
    case message = "MESSAGE"
    case notify = "NOTIFY"
}