import Foundation

/// Why the path is not exercised: a reason the simulations mock the tool, or why a native path is never reached. New reasons may be added.
public enum SimulationOnboardingToolGapDtoReason: String, Codable, Hashable, CaseIterable, Sendable {
    case dynamicHandoff = "dynamic-handoff"
    case destinationNotPlain = "destination-not-plain"
    case destinationUnresolved = "destination-unresolved"
    case destinationTruncated = "destination-truncated"
    case transferExternal = "transfer-external"
    case destinationNameUnscoped = "destination-name-unscoped"
    case nativeToolShadowed = "native-tool-shadowed"
}