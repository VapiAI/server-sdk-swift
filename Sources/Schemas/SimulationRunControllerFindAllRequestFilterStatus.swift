import Foundation

public enum SimulationRunControllerFindAllRequestFilterStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case passed
    case failed
    case running
}