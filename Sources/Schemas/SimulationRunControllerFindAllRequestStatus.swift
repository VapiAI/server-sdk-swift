import Foundation

public enum SimulationRunControllerFindAllRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case queued
    case running
    case ended
}