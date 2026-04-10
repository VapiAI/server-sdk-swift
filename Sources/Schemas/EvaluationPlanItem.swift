import Foundation

public struct EvaluationPlanItem: Codable, Hashable, Sendable {
    /// This is the ID of an existing structured output to use for evaluation.
    /// Mutually exclusive with structuredOutput.
    public let structuredOutputId: String?
    /// This is an inline structured output definition for evaluation.
    /// Mutually exclusive with structuredOutputId.
    /// Only primitive schema types (string, number, integer, boolean) are allowed.
    public let structuredOutput: CreateStructuredOutputDto?
    /// This is the comparison operator to use when evaluating the extracted value against the expected value.
    /// Available operators depend on the structured output's schema type:
    /// - boolean: '=', '!='
    /// - string: '=', '!='
    /// - number/integer: '=', '!=', '>', '<', '>=', '<='
    public let comparator: EvaluationPlanItemComparator
    /// This is the expected value to compare against the extracted structured output result.
    /// Type should match the structured output's schema type.
    public let value: EvaluationPlanItemValue
    /// This is whether this evaluation must pass for the simulation to pass.
    /// Defaults to true. If false, the result is informational only.
    public let required: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        structuredOutputId: String? = nil,
        structuredOutput: CreateStructuredOutputDto? = nil,
        comparator: EvaluationPlanItemComparator,
        value: EvaluationPlanItemValue,
        required: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.structuredOutputId = structuredOutputId
        self.structuredOutput = structuredOutput
        self.comparator = comparator
        self.value = value
        self.required = required
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.structuredOutputId = try container.decodeIfPresent(String.self, forKey: .structuredOutputId)
        self.structuredOutput = try container.decodeIfPresent(CreateStructuredOutputDto.self, forKey: .structuredOutput)
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
        try container.encode(self.comparator, forKey: .comparator)
        try container.encode(self.value, forKey: .value)
        try container.encodeIfPresent(self.required, forKey: .required)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case structuredOutputId
        case structuredOutput
        case comparator
        case value
        case required
    }
}