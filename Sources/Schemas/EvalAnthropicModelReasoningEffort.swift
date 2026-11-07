import Foundation

/// Reasoning effort for the judge on claude-haiku-5-5. `none` turns thinking
/// off. `low` to `max` let the judge think before it submits its verdict.
/// Unset means `none`. Rejected for every other model.
public enum EvalAnthropicModelReasoningEffort: String, Codable, Hashable, CaseIterable, Sendable {
    case none
    case low
    case medium
    case high
    case xhigh
    case max
}