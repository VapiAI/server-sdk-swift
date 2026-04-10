import Foundation

/// This is the current status of the run.
public enum SimulationRunItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case queued
    case running
    case evaluating
    case passed
    case failed
    case canceled
}