import Foundation

/// This is how the call's per-turn latencies are aggregated before comparing.
/// p95 uses the nearest-rank method, so on calls with fewer than 20 turns it
/// equals the max.
public enum LatencyExpectationAggregation: String, Codable, Hashable, CaseIterable, Sendable {
    case mean
    case median
    case p95
    case max
}