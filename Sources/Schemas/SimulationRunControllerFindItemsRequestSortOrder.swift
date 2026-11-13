import Foundation

public enum SimulationRunControllerFindItemsRequestSortOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case asc = "ASC"
    case desc = "DESC"
}