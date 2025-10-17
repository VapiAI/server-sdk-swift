import Foundation

public enum CallControllerFindAllPaginatedRequestSortOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case asc = "ASC"
    case desc = "DESC"
}