import Foundation

public enum SimulationSuiteControllerFindAllRequestSortBy: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt
    case duration
    case cost
}