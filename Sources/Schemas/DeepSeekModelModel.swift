import Foundation

/// This is the name of the model. Ex. cognitivecomputations/dolphin-mixtral-8x7b
public enum DeepSeekModelModel: String, Codable, Hashable, CaseIterable, Sendable {
    case deepseekChat = "deepseek-chat"
    case deepseekReasoner = "deepseek-reasoner"
}