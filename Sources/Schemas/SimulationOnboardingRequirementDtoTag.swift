import Foundation

/// Indicates an assumption, a requirement that needs a voice simulation, or a requirement that cannot be tested.
public enum SimulationOnboardingRequirementDtoTag: String, Codable, Hashable, CaseIterable, Sendable {
    case assumption
    case notTestable = "not-testable"
    case voiceOnly = "voice-only"
}