import Foundation

public struct LatencyExpectation: Codable, Hashable, Sendable {
    /// This is the latency component to measure.
    /// - turn: total time from the end of user speech to the start of assistant speech
    /// - model: LLM time to first token
    /// - voice: TTS time to first audio
    public let metric: LatencyExpectationMetric
    /// This is how the call's per-turn latencies are aggregated before comparing.
    /// p95 uses the nearest-rank method, so on calls with fewer than 20 turns it
    /// equals the max.
    public let aggregation: LatencyExpectationAggregation
    /// This is the ceiling in milliseconds. The expectation passes when the
    /// aggregated latency is less than or equal to this value.
    public let thresholdMs: Double
    /// This is whether this expectation must pass for the simulation to pass.
    /// Defaults to true. If false, the result is informational only.
    /// On a voice simulation, a metric that no turn measured fails the expectation.
    /// GPT Live targets are skipped, because their latency is not measured yet.
    public let required: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        metric: LatencyExpectationMetric,
        aggregation: LatencyExpectationAggregation,
        thresholdMs: Double,
        required: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.metric = metric
        self.aggregation = aggregation
        self.thresholdMs = thresholdMs
        self.required = required
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.metric = try container.decode(LatencyExpectationMetric.self, forKey: .metric)
        self.aggregation = try container.decode(LatencyExpectationAggregation.self, forKey: .aggregation)
        self.thresholdMs = try container.decode(Double.self, forKey: .thresholdMs)
        self.required = try container.decodeIfPresent(Bool.self, forKey: .required)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.metric, forKey: .metric)
        try container.encode(self.aggregation, forKey: .aggregation)
        try container.encode(self.thresholdMs, forKey: .thresholdMs)
        try container.encodeIfPresent(self.required, forKey: .required)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case metric
        case aggregation
        case thresholdMs
        case required
    }
}