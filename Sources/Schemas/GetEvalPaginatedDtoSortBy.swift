import Foundation

/// This is the column to sort by. Defaults to 'createdAt'.
public enum GetEvalPaginatedDtoSortBy: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt
    case duration
    case cost
}