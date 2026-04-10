import Foundation

/// Current status of the run
public enum SimulationRunStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case queued
    case running
    case ended
}