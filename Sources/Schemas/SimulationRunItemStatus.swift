import Foundation

/// The run item's current status.
public enum SimulationRunItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case queued
    case running
    case evaluating
    case passed
    case failed
    case canceled
}