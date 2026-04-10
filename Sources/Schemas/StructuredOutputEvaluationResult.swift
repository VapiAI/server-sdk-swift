import Foundation

public struct StructuredOutputEvaluationResult: Codable, Hashable, Sendable {
    /// This is the ID of the structured output that was evaluated.
    /// Will be 'inline' for inline structured output definitions.
    public let structuredOutputId: String
    /// This is the name of the structured output.
    public let name: String
    /// This is the value extracted from the call by the structured output.
    public let extractedValue: Nullable<StructuredOutputEvaluationResultExtractedValue>
    /// This is the expected value that was defined in the evaluation plan.
    public let expectedValue: StructuredOutputEvaluationResultExpectedValue
    /// This is the comparison operator used for evaluation.
    public let comparator: StructuredOutputEvaluationResultComparator
    /// This indicates whether the evaluation passed (extracted value matched expected value using comparator).
    public let passed: Bool
    /// This indicates whether this evaluation was required for the simulation to pass.
    public let required: Bool
    /// This contains any error that occurred during extraction.
    public let error: String?
    /// This indicates whether this evaluation was skipped (e.g., multimodal in chat mode).
    public let isSkipped: Bool?
    /// This contains the reason for skipping the evaluation.
    public let skipReason: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        structuredOutputId: String,
        name: String,
        extractedValue: Nullable<StructuredOutputEvaluationResultExtractedValue>,
        expectedValue: StructuredOutputEvaluationResultExpectedValue,
        comparator: StructuredOutputEvaluationResultComparator,
        passed: Bool,
        required: Bool,
        error: String? = nil,
        isSkipped: Bool? = nil,
        skipReason: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.structuredOutputId = structuredOutputId
        self.name = name
        self.extractedValue = extractedValue
        self.expectedValue = expectedValue
        self.comparator = comparator
        self.passed = passed
        self.required = required
        self.error = error
        self.isSkipped = isSkipped
        self.skipReason = skipReason
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.structuredOutputId = try container.decode(String.self, forKey: .structuredOutputId)
        self.name = try container.decode(String.self, forKey: .name)
        self.extractedValue = try container.decode(Nullable<StructuredOutputEvaluationResultExtractedValue>.self, forKey: .extractedValue)
        self.expectedValue = try container.decode(StructuredOutputEvaluationResultExpectedValue.self, forKey: .expectedValue)
        self.comparator = try container.decode(StructuredOutputEvaluationResultComparator.self, forKey: .comparator)
        self.passed = try container.decode(Bool.self, forKey: .passed)
        self.required = try container.decode(Bool.self, forKey: .required)
        self.error = try container.decodeIfPresent(String.self, forKey: .error)
        self.isSkipped = try container.decodeIfPresent(Bool.self, forKey: .isSkipped)
        self.skipReason = try container.decodeIfPresent(String.self, forKey: .skipReason)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.structuredOutputId, forKey: .structuredOutputId)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.extractedValue, forKey: .extractedValue)
        try container.encode(self.expectedValue, forKey: .expectedValue)
        try container.encode(self.comparator, forKey: .comparator)
        try container.encode(self.passed, forKey: .passed)
        try container.encode(self.required, forKey: .required)
        try container.encodeIfPresent(self.error, forKey: .error)
        try container.encodeIfPresent(self.isSkipped, forKey: .isSkipped)
        try container.encodeIfPresent(self.skipReason, forKey: .skipReason)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case structuredOutputId
        case name
        case extractedValue
        case expectedValue
        case comparator
        case passed
        case required
        case error
        case isSkipped
        case skipReason
    }
}