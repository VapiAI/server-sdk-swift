import Foundation

/// The reasoner uses OpenAI. Omit to use OpenAI.
public enum OpenAiReasonerProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case openai
}