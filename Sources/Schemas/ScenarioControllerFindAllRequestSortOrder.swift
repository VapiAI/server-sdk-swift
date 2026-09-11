import Foundation

public enum ScenarioControllerFindAllRequestSortOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case asc = "ASC"
    case desc = "DESC"
}