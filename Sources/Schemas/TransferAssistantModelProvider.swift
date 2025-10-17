import Foundation

/// The model provider for the transfer assistant
public enum TransferAssistantModelProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case openai
    case anthropic
    case google
    case customLlm = "custom-llm"
}