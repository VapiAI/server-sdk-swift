import Foundation

/// Evaluation sensitivity; numeric cutoffs are internal and provisional.
public enum GuardrailRuleSensitivity: String, Codable, Hashable, CaseIterable, Sendable {
    case low
    case medium
    case aggressive
}