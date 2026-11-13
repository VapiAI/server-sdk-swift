import Foundation

/// Vapi-managed model version (update channel). When set, this is a Vapi-managed
/// LLM routed by the registry; when absent, this is the legacy workflow form
/// below (`steps` / `workflow`).
public enum VapiModelVersion: String, Codable, Hashable, CaseIterable, Sendable {
    case latest
    case one = "1"
}