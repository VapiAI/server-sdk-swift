import Foundation

public enum StructuredOutputControllerFindAllRequestSortBy: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt
    case duration
    case cost
}