import Foundation

/// This is the type of filter - matches when the specified field starts with any of the given prefixes
public enum PhoneNumberCallRingingHookFilterType: String, Codable, Hashable, CaseIterable, Sendable {
    case startsWith
}