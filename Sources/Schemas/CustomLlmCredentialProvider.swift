import Foundation

public enum CustomLlmCredentialProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case customLlm = "custom-llm"
}