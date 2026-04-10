import Foundation

/// This is the key to filter on - only "call.endedReason" is allowed for phone number call ending hooks
public enum PhoneNumberCallEndingHookFilterKey: String, Codable, Hashable, CaseIterable, Sendable {
    case callEndedReason = "call.endedReason"
}