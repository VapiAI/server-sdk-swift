import Foundation

public enum InsightControllerFindAllRequestSortOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case asc = "ASC"
    case desc = "DESC"
}