import Foundation

/// Current status of the run
public enum SimulationRunListItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case queued
    case running
    case ended
}