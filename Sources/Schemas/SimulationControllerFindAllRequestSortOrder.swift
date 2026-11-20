import Foundation

public enum SimulationControllerFindAllRequestSortOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case asc = "ASC"
    case desc = "DESC"
}