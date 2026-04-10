import Foundation

/// The type of security threat to filter.
public enum PromptInjectionSecurityFilterType: String, Codable, Hashable, CaseIterable, Sendable {
    case promptInjection = "prompt-injection"
}