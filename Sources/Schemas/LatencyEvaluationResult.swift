import Foundation

public struct LatencyEvaluationResult: Codable, Hashable, Sendable {
    /// This is the latency component that was measured.
    public let metric: LatencyEvaluationResultMetric
    /// This is how the per-turn latencies were aggregated.
    public let aggregation: LatencyEvaluationResultAggregation
    /// This is the ceiling in milliseconds the aggregated latency was compared against.
    public let thresholdMs: Double
    /// This is the aggregated latency in milliseconds, rounded to the nearest
    /// millisecond. The pass/fail verdict is decided on this rounded value.
    /// Absent when the expectation was skipped or no turn measured this metric.
    public let actualMs: Double?
    /// This is the number of turns that contributed a value for this metric.
    public let sampleCount: Double
    /// This indicates whether the aggregated latency was at or below the threshold.
    public let passed: Bool
    /// This indicates whether this expectation was required for the simulation to pass.
    public let required: Bool
    /// This indicates whether this expectation was skipped. Expectations are only
    /// skipped on chat simulations and GPT Live targets, which record no latency.
    public let isSkipped: Bool?
    /// This contains the reason for skipping the expectation.
    public let skipReason: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        metric: LatencyEvaluationResultMetric,
        aggregation: LatencyEvaluationResultAggregation,
        thresholdMs: Double,
        actualMs: Double? = nil,
        sampleCount: Double,
        passed: Bool,
        required: Bool,
        isSkipped: Bool? = nil,
        skipReason: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.metric = metric
        self.aggregation = aggregation
        self.thresholdMs = thresholdMs
        self.actualMs = actualMs
        self.sampleCount = sampleCount
        self.passed = passed
        self.required = required
        self.isSkipped = isSkipped
        self.skipReason = skipReason
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.metric = try container.decode(LatencyEvaluationResultMetric.self, forKey: .metric)
        self.aggregation = try container.decode(LatencyEvaluationResultAggregation.self, forKey: .aggregation)
        self.thresholdMs = try container.decode(Double.self, forKey: .thresholdMs)
        self.actualMs = try container.decodeIfPresent(Double.self, forKey: .actualMs)
        self.sampleCount = try container.decode(Double.self, forKey: .sampleCount)
        self.passed = try container.decode(Bool.self, forKey: .passed)
        self.required = try container.decode(Bool.self, forKey: .required)
        self.isSkipped = try container.decodeIfPresent(Bool.self, forKey: .isSkipped)
        self.skipReason = try container.decodeIfPresent(String.self, forKey: .skipReason)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.metric, forKey: .metric)
        try container.encode(self.aggregation, forKey: .aggregation)
        try container.encode(self.thresholdMs, forKey: .thresholdMs)
        try container.encodeIfPresent(self.actualMs, forKey: .actualMs)
        try container.encode(self.sampleCount, forKey: .sampleCount)
        try container.encode(self.passed, forKey: .passed)
        try container.encode(self.required, forKey: .required)
        try container.encodeIfPresent(self.isSkipped, forKey: .isSkipped)
        try container.encodeIfPresent(self.skipReason, forKey: .skipReason)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case metric
        case aggregation
        case thresholdMs
        case actualMs
        case sampleCount
        case passed
        case required
        case isSkipped
        case skipReason
    }
}