import Foundation

/// This is how the per-turn latencies were aggregated.
public enum LatencyEvaluationResultAggregation: String, Codable, Hashable, CaseIterable, Sendable {
    case mean
    case median
    case p95
    case max
}