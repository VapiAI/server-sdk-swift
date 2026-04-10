import Foundation

/// This is the sort order for pagination. Defaults to 'DESC'.
public enum ExportChatDtoSortOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case asc = "ASC"
    case desc = "DESC"
}