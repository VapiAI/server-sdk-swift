import Foundation

/// The field to check. Currently only "number" (the caller's phone number) is supported.
public enum PhoneNumberCallRingingHookFilterKey: String, Codable, Hashable, CaseIterable, Sendable {
    case number
}