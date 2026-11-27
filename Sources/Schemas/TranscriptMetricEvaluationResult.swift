import Foundation

public struct TranscriptMetricEvaluationResult: Codable, Hashable, Sendable {
    /// This is the evaluation's position in the scenario's evaluations.
    public let index: Double
    /// This is the metric evaluated.
    public let metric: TranscriptMetricEvaluationResultMetric
    /// This is the comparison made: the metric's value on the left, `expectedValue` on the right.
    public let comparator: TranscriptMetricEvaluationResultComparator
    /// This is the value the evaluation compares against.
    public let expectedValue: Double
    /// This is the metric's value for this run. Null when it could not be measured, such as a word error rate for an
    /// answer key with no words; the evaluation then fails.
    public let actualValue: Nullable<Double>
    /// This is whether the comparison held.
    public let passed: Bool
    /// This is whether the evaluation decides pass or fail. When false it is informational only.
    public let required: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        index: Double,
        metric: TranscriptMetricEvaluationResultMetric,
        comparator: TranscriptMetricEvaluationResultComparator,
        expectedValue: Double,
        actualValue: Nullable<Double>,
        passed: Bool,
        required: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.index = index
        self.metric = metric
        self.comparator = comparator
        self.expectedValue = expectedValue
        self.actualValue = actualValue
        self.passed = passed
        self.required = required
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.index = try container.decode(Double.self, forKey: .index)
        self.metric = try container.decode(TranscriptMetricEvaluationResultMetric.self, forKey: .metric)
        self.comparator = try container.decode(TranscriptMetricEvaluationResultComparator.self, forKey: .comparator)
        self.expectedValue = try container.decode(Double.self, forKey: .expectedValue)
        self.actualValue = try container.decode(Nullable<Double>.self, forKey: .actualValue)
        self.passed = try container.decode(Bool.self, forKey: .passed)
        self.required = try container.decode(Bool.self, forKey: .required)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.index, forKey: .index)
        try container.encode(self.metric, forKey: .metric)
        try container.encode(self.comparator, forKey: .comparator)
        try container.encode(self.expectedValue, forKey: .expectedValue)
        try container.encode(self.actualValue, forKey: .actualValue)
        try container.encode(self.passed, forKey: .passed)
        try container.encode(self.required, forKey: .required)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case index
        case metric
        case comparator
        case expectedValue
        case actualValue
        case passed
        case required
    }
}