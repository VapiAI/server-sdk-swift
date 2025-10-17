import Foundation

/// This is the provider of the model.
public enum EvalModelListOptionsProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case openai
    case anthropic
    case google
    case groq
    case customLlm = "custom-llm"
}