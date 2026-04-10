import Foundation

/// The type of security threat to filter.
public enum SqlInjectionSecurityFilterType: String, Codable, Hashable, CaseIterable, Sendable {
    case sqlInjection = "sql-injection"
}