import Foundation

public enum SimulationRunListSourceType: String, Codable, Hashable, CaseIterable, Sendable {
    case suite
    case simulation
    case adHoc
    case api
}