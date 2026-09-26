import Foundation

/// This is the type of target assigned to the simulation suite.
public enum SimulationSuiteTargetAssignmentTargetType: String, Codable, Hashable, CaseIterable, Sendable {
    case assistant
    case squad
}