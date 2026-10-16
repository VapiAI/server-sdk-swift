import Foundation

/// This is the latency component that was measured.
public enum LatencyEvaluationResultMetric: String, Codable, Hashable, CaseIterable, Sendable {
    case turn
    case model
    case voice
}