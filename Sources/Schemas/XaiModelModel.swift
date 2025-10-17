import Foundation

/// This is the name of the model. Ex. cognitivecomputations/dolphin-mixtral-8x7b
public enum XaiModelModel: String, Codable, Hashable, CaseIterable, Sendable {
    case grokBeta = "grok-beta"
    case grok2 = "grok-2"
    case grok3 = "grok-3"
    case grok4FastReasoning = "grok-4-fast-reasoning"
    case grok4FastNonReasoning = "grok-4-fast-non-reasoning"
}