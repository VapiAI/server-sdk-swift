import Foundation

/// The type of security threat to filter.
public enum RegexSecurityFilterType: String, Codable, Hashable, CaseIterable, Sendable {
    case regex
}