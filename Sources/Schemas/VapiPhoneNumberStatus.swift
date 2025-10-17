import Foundation

/// This is the status of the phone number.
public enum VapiPhoneNumberStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case activating
    case blocked
}