import Foundation

/// This is the search method used when searching for relevant chunks from the vector store.
public enum TrieveKnowledgeBaseSearchPlanSearchType: String, Codable, Hashable, CaseIterable, Sendable {
    case fulltext
    case semantic
    case hybrid
    case bm25
}