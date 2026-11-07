import Foundation

public enum UpdateWorkflowDtoBackgroundSoundZero: String, Codable, Hashable, CaseIterable, Sendable {
    case off
    case office
    case whiteNoise = "white-noise"
    case city
    case crowd
    case farm
}