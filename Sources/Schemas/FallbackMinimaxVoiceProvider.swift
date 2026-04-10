import Foundation

/// This is the voice provider that will be used.
public enum FallbackMinimaxVoiceProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case minimax
}