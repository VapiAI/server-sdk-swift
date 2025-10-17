import Foundation

/// This is the status of the phone number.
public enum ByoPhoneNumberStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case activating
    case blocked
}