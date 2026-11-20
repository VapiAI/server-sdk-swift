import Foundation

public enum AssistantDraftBackgroundSoundZero: String, Codable, Hashable, CaseIterable, Sendable {
    case off
    case office
    case whiteNoise = "white-noise"
    case city
    case crowd
    case farm
}