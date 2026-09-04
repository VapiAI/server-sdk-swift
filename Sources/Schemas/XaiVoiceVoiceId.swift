import Foundation

/// Built-in voices: eve, ara, rex, sal, leo. Cloned voice IDs are also accepted.
public enum XaiVoiceVoiceId: String, Codable, Hashable, CaseIterable, Sendable {
    case eve
    case ara
    case rex
    case sal
    case leo
}