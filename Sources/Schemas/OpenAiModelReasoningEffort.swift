import Foundation

/// Reasoning effort for reasoning-capable OpenAI models.
/// For `gpt-realtime-2`: forwarded to V2 stream's session.update as `reasoning.effort`.
/// For non-realtime OpenAI models, model-aware validation limits newly public
/// values while preserving the existing four-value storage contract.
public enum OpenAiModelReasoningEffort: String, Codable, Hashable, CaseIterable, Sendable {
    case minimal
    case none
    case low
    case medium
    case high
    case xhigh
}