import Foundation

/// Mode of operation when a security threat is detected.
/// - 'sanitize': Remove or replace the threatening content
/// - 'reject': Replace the entire transcript with replacement text
/// - 'replace': Replace threatening patterns with replacement text
/// @default 'sanitize'
public enum SecurityFilterPlanMode: String, Codable, Hashable, CaseIterable, Sendable {
    case sanitize
    case reject
    case replace
}