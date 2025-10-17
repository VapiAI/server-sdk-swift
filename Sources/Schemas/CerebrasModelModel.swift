import Foundation

/// This is the name of the model. Ex. cognitivecomputations/dolphin-mixtral-8x7b
public enum CerebrasModelModel: String, Codable, Hashable, CaseIterable, Sendable {
    case llama318B = "llama3.1-8b"
    case llama3370B = "llama-3.3-70b"
}