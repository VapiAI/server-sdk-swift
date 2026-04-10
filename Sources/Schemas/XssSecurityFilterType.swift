import Foundation

/// The type of security threat to filter.
public enum XssSecurityFilterType: String, Codable, Hashable, CaseIterable, Sendable {
    case xss
}