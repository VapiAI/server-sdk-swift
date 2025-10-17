import Foundation

/// Playht voice model/engine to use.
public enum FallbackPlayHtVoiceModel: String, Codable, Hashable, CaseIterable, Sendable {
    case playHt20 = "PlayHT2.0"
    case playHt20Turbo = "PlayHT2.0-turbo"
    case play30Mini = "Play3.0-mini"
    case playDialog = "PlayDialog"
}