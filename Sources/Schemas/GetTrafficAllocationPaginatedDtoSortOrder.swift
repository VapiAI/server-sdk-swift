import Foundation

/// The sort order for pagination. Defaults to 'DESC'.
public enum GetTrafficAllocationPaginatedDtoSortOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case asc = "ASC"
    case desc = "DESC"
}