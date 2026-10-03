import Foundation

public enum SimulationRunControllerFindItemsRequestSortBy: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt
    case duration
    case cost
}