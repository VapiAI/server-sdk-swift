import Foundation

/// This is the specific model that will be used.
public enum EvalAnthropicModelModel: String, Codable, Hashable, CaseIterable, Sendable {
    case claude3Opus20240229 = "claude-3-opus-20240229"
    case claude3Sonnet20240229 = "claude-3-sonnet-20240229"
    case claude3Haiku20240307 = "claude-3-haiku-20240307"
    case claude35Sonnet20240620 = "claude-3-5-sonnet-20240620"
    case claude35Sonnet20241022 = "claude-3-5-sonnet-20241022"
    case claude35Haiku20241022 = "claude-3-5-haiku-20241022"
    case claude37Sonnet20250219 = "claude-3-7-sonnet-20250219"
    case claudeOpus420250514 = "claude-opus-4-20250514"
    case claudeSonnet420250514 = "claude-sonnet-4-20250514"
    case claudeSonnet4520250929 = "claude-sonnet-4-5-20250929"
    case claudeHaiku4520251001 = "claude-haiku-4-5-20251001"
}