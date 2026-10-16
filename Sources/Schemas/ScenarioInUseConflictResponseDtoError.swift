import Foundation

public enum ScenarioInUseConflictResponseDtoError: String, Codable, Hashable, CaseIterable, Sendable {
    case scenarioInUse = "scenario_in_use"
}