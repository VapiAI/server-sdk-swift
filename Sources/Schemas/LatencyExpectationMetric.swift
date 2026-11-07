import Foundation

/// This is the latency component to measure.
/// - turn: total time from the end of user speech to the start of assistant speech
/// - model: LLM time to first token
/// - voice: TTS time to first audio
public enum LatencyExpectationMetric: String, Codable, Hashable, CaseIterable, Sendable {
    case turn
    case model
    case voice
}