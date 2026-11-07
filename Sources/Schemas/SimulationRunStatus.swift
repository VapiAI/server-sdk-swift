import Foundation

/// The run's current status. One of `queued`, `running`, or `ended`.
public enum SimulationRunStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case queued
    case running
    case ended
}