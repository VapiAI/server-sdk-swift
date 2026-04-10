import Foundation

/// The type of security threat to filter.
public enum RceSecurityFilterType: String, Codable, Hashable, CaseIterable, Sendable {
    case rce
}