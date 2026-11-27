import Foundation

public struct EvaluationPlanItem: Codable, Hashable, Sendable {
    /// The ID of an existing structured output to evaluate. Use this to reuse a structured output across scenarios. Provide either `structuredOutputId` or an inline `structuredOutput`.
    public let structuredOutputId: String?
    /// An inline structured output to evaluate, defined by its name and schema. Only primitive types (string, number, integer, boolean) are allowed. Provide either this or `structuredOutputId`.
    public let structuredOutput: CreateStructuredOutputDto?
    /// This is a built-in metric to evaluate instead of a structured output. Mutually exclusive with structuredOutputId
    /// and structuredOutput, and only available on a scenario with `transcriptReplay`, which takes no other evaluations.
    /// - wer: the word error rate of the replayed recording's transcript against the answer key, as a fraction where 0
    ///   is perfect and 0.1 is 10%; insertions can push it above 1. `value` must be from 0 to 1. For example,
    ///   `{ "metric": "wer", "comparator": "<=", "value": 0.1 }`.
    public let metric: EvaluationPlanItemMetric?
    /// Optional dot-notation path to a primitive leaf when evaluating an object structured output.
    public let path: String?
    /// How the structured output value is compared against `value`. Available operators depend on the output type. Boolean and string support `=` and `!=`; number and integer support `=`, `!=`, `>`, `<`, `>=`, `<=`.
    public let comparator: EvaluationPlanItemComparator
    /// The expected value the structured output is compared against. Its type should match the structured output's type, for example `true` for a boolean.
    public let value: EvaluationPlanItemValue
    /// Set to `false` to record this evaluation's result without requiring it to pass. Default is `true`.
    public let required: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        structuredOutputId: String? = nil,
        structuredOutput: CreateStructuredOutputDto? = nil,
        metric: EvaluationPlanItemMetric? = nil,
        path: String? = nil,
        comparator: EvaluationPlanItemComparator,
        value: EvaluationPlanItemValue,
        required: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.structuredOutputId = structuredOutputId
        self.structuredOutput = structuredOutput
        self.metric = metric
        self.path = path
        self.comparator = comparator
        self.value = value
        self.required = required
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.structuredOutputId = try container.decodeIfPresent(String.self, forKey: .structuredOutputId)
        self.structuredOutput = try container.decodeIfPresent(CreateStructuredOutputDto.self, forKey: .structuredOutput)
        self.metric = try container.decodeIfPresent(EvaluationPlanItemMetric.self, forKey: .metric)
        self.path = try container.decodeIfPresent(String.self, forKey: .path)
        self.comparator = try container.decode(EvaluationPlanItemComparator.self, forKey: .comparator)
        self.value = try container.decode(EvaluationPlanItemValue.self, forKey: .value)
        self.required = try container.decodeIfPresent(Bool.self, forKey: .required)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.structuredOutputId, forKey: .structuredOutputId)
        try container.encodeIfPresent(self.structuredOutput, forKey: .structuredOutput)
        try container.encodeIfPresent(self.metric, forKey: .metric)
        try container.encodeIfPresent(self.path, forKey: .path)
        try container.encode(self.comparator, forKey: .comparator)
        try container.encode(self.value, forKey: .value)
        try container.encodeIfPresent(self.required, forKey: .required)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case structuredOutputId
        case structuredOutput
        case metric
        case path
        case comparator
        case value
        case required
    }
}