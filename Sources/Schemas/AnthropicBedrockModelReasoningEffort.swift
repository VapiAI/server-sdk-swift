import Foundation

/// Reasoning effort for claude-haiku-5-5. `none` turns thinking off. `low` to `max`
/// use adaptive thinking at that effort; higher effort can add latency before the
/// model speaks. Unset means `none`. Rejected for every other model.
public enum AnthropicBedrockModelReasoningEffort: String, Codable, Hashable, CaseIterable, Sendable {
    case none
    case low
    case medium
    case high
    case xhigh
    case max
}