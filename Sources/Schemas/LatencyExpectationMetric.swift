import Foundation

/// This is the latency component to measure.
/// - turn: total time from the end of user speech to the start of assistant speech
/// - model: LLM time to first token
/// - voice: TTS time to first audio
/// - transcriber: time from the end of user speech to the transcript's words being known
/// - endpointing: time from the transcript's words being known to deciding the user finished their turn
/// 
/// Turns where a component was not measured are left out of that metric.
public enum LatencyExpectationMetric: String, Codable, Hashable, CaseIterable, Sendable {
    case turn
    case model
    case voice
    case transcriber
    case endpointing
}