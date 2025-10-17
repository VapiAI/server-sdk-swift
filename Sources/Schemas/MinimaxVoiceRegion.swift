import Foundation

/// The region for Minimax API. Defaults to "worldwide".
public enum MinimaxVoiceRegion: String, Codable, Hashable, CaseIterable, Sendable {
    case worldwide
    case china
}