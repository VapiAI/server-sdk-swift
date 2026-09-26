import Foundation

/// The delegated reasoning model. Omit to use GPT-5.6 Terra.
public enum OpenAiReasonerModel: String, Codable, Hashable, CaseIterable, Sendable {
    case gpt56Sol = "gpt-5.6-sol"
    case gpt56Terra = "gpt-5.6-terra"
    case gpt56Luna = "gpt-5.6-luna"
}