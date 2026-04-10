import Foundation

/// Controls the granularity of subtitle/timing data returned by Minimax
/// during synthesis. Set to 'word' to receive per-word timestamps in
/// assistant.speechStarted events for karaoke-style caption rendering.
/// 
/// @default "sentence"
public enum FallbackMinimaxVoiceSubtitleType: String, Codable, Hashable, CaseIterable, Sendable {
    case word
    case sentence
}