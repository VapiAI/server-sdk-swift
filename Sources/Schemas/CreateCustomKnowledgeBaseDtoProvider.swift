import Foundation

/// This knowledge base is bring your own knowledge base implementation.
public enum CreateCustomKnowledgeBaseDtoProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case customKnowledgeBase = "custom-knowledge-base"
}