import Foundation

/// This knowledge base is bring your own knowledge base implementation.
public enum UpdateCustomKnowledgeBaseDtoProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case customKnowledgeBase = "custom-knowledge-base"
}