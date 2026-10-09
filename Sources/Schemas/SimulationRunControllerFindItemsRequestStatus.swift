import Foundation

public enum SimulationRunControllerFindItemsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case queued
    case running
    case evaluating
    case passed
    case failed
    case canceled
}