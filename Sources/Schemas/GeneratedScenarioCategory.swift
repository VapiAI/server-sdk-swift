import Foundation

/// Scenario category
public enum GeneratedScenarioCategory: String, Codable, Hashable, CaseIterable, Sendable {
    case happyPath = "happy_path"
    case edgeCase = "edge_case"
    case failureMode = "failure_mode"
}