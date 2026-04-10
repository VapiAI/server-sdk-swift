import Foundation

/// This is the sort order for pagination. Defaults to 'DESC'.
public enum ExportSessionDtoSortOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case asc = "ASC"
    case desc = "DESC"
}