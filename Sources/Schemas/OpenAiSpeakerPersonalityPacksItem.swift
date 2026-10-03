import Foundation

public enum OpenAiSpeakerPersonalityPacksItem: String, Codable, Hashable, CaseIterable, Sendable {
    case eagerListener = "eager-listener"
    case idleHummer = "idle-hummer"
    case bouncy
    case unhurried
}