import Foundation

/// The type of security threat to filter.
public enum SsrfSecurityFilterType: String, Codable, Hashable, CaseIterable, Sendable {
    case ssrf
}