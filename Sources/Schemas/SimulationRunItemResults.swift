import Foundation

public struct SimulationRunItemResults: Codable, Hashable, Sendable {
    /// This is the list of results from structured output evaluations.
    public let evaluations: [StructuredOutputEvaluationResult]
    /// This indicates whether all required evaluations passed.
    public let passed: Bool
    /// This contains the latency metrics collected from the call.
    public let latencyMetrics: LatencyMetrics?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        evaluations: [StructuredOutputEvaluationResult],
        passed: Bool,
        latencyMetrics: LatencyMetrics? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.evaluations = evaluations
        self.passed = passed
        self.latencyMetrics = latencyMetrics
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.evaluations = try container.decode([StructuredOutputEvaluationResult].self, forKey: .evaluations)
        self.passed = try container.decode(Bool.self, forKey: .passed)
        self.latencyMetrics = try container.decodeIfPresent(LatencyMetrics.self, forKey: .latencyMetrics)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.evaluations, forKey: .evaluations)
        try container.encode(self.passed, forKey: .passed)
        try container.encodeIfPresent(self.latencyMetrics, forKey: .latencyMetrics)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case evaluations
        case passed
        case latencyMetrics
    }
}