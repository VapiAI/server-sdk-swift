import Foundation

public enum KnowledgeBaseV2FileStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case indexing
    case ready
    case failed
}