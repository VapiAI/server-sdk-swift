import Foundation

public enum ScorecardControllerGetPaginatedRequestSortBy: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt
    case duration
    case cost
}