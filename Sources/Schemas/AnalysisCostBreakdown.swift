import Foundation

public struct AnalysisCostBreakdown: Codable, Hashable, Sendable {
    /// This is the cost to summarize the call.
    public let summary: Double?
    /// This is the number of prompt tokens used to summarize the call.
    public let summaryPromptTokens: Double?
    /// This is the number of completion tokens used to summarize the call.
    public let summaryCompletionTokens: Double?
    /// This is the cost to extract structured data from the call.
    public let structuredData: Double?
    /// This is the number of prompt tokens used to extract structured data from the call.
    public let structuredDataPromptTokens: Double?
    /// This is the number of completion tokens used to extract structured data from the call.
    public let structuredDataCompletionTokens: Double?
    /// This is the cost to evaluate if the call was successful.
    public let successEvaluation: Double?
    /// This is the number of prompt tokens used to evaluate if the call was successful.
    public let successEvaluationPromptTokens: Double?
    /// This is the number of completion tokens used to evaluate if the call was successful.
    public let successEvaluationCompletionTokens: Double?
    /// This is the cost to evaluate structuredOutputs from the call.
    public let structuredOutput: Double?
    /// This is the number of prompt tokens used to evaluate structuredOutputs from the call.
    public let structuredOutputPromptTokens: Double?
    /// This is the number of completion tokens used to evaluate structuredOutputs from the call.
    public let structuredOutputCompletionTokens: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        summary: Double? = nil,
        summaryPromptTokens: Double? = nil,
        summaryCompletionTokens: Double? = nil,
        structuredData: Double? = nil,
        structuredDataPromptTokens: Double? = nil,
        structuredDataCompletionTokens: Double? = nil,
        successEvaluation: Double? = nil,
        successEvaluationPromptTokens: Double? = nil,
        successEvaluationCompletionTokens: Double? = nil,
        structuredOutput: Double? = nil,
        structuredOutputPromptTokens: Double? = nil,
        structuredOutputCompletionTokens: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.summary = summary
        self.summaryPromptTokens = summaryPromptTokens
        self.summaryCompletionTokens = summaryCompletionTokens
        self.structuredData = structuredData
        self.structuredDataPromptTokens = structuredDataPromptTokens
        self.structuredDataCompletionTokens = structuredDataCompletionTokens
        self.successEvaluation = successEvaluation
        self.successEvaluationPromptTokens = successEvaluationPromptTokens
        self.successEvaluationCompletionTokens = successEvaluationCompletionTokens
        self.structuredOutput = structuredOutput
        self.structuredOutputPromptTokens = structuredOutputPromptTokens
        self.structuredOutputCompletionTokens = structuredOutputCompletionTokens
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.summary = try container.decodeIfPresent(Double.self, forKey: .summary)
        self.summaryPromptTokens = try container.decodeIfPresent(Double.self, forKey: .summaryPromptTokens)
        self.summaryCompletionTokens = try container.decodeIfPresent(Double.self, forKey: .summaryCompletionTokens)
        self.structuredData = try container.decodeIfPresent(Double.self, forKey: .structuredData)
        self.structuredDataPromptTokens = try container.decodeIfPresent(Double.self, forKey: .structuredDataPromptTokens)
        self.structuredDataCompletionTokens = try container.decodeIfPresent(Double.self, forKey: .structuredDataCompletionTokens)
        self.successEvaluation = try container.decodeIfPresent(Double.self, forKey: .successEvaluation)
        self.successEvaluationPromptTokens = try container.decodeIfPresent(Double.self, forKey: .successEvaluationPromptTokens)
        self.successEvaluationCompletionTokens = try container.decodeIfPresent(Double.self, forKey: .successEvaluationCompletionTokens)
        self.structuredOutput = try container.decodeIfPresent(Double.self, forKey: .structuredOutput)
        self.structuredOutputPromptTokens = try container.decodeIfPresent(Double.self, forKey: .structuredOutputPromptTokens)
        self.structuredOutputCompletionTokens = try container.decodeIfPresent(Double.self, forKey: .structuredOutputCompletionTokens)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.summary, forKey: .summary)
        try container.encodeIfPresent(self.summaryPromptTokens, forKey: .summaryPromptTokens)
        try container.encodeIfPresent(self.summaryCompletionTokens, forKey: .summaryCompletionTokens)
        try container.encodeIfPresent(self.structuredData, forKey: .structuredData)
        try container.encodeIfPresent(self.structuredDataPromptTokens, forKey: .structuredDataPromptTokens)
        try container.encodeIfPresent(self.structuredDataCompletionTokens, forKey: .structuredDataCompletionTokens)
        try container.encodeIfPresent(self.successEvaluation, forKey: .successEvaluation)
        try container.encodeIfPresent(self.successEvaluationPromptTokens, forKey: .successEvaluationPromptTokens)
        try container.encodeIfPresent(self.successEvaluationCompletionTokens, forKey: .successEvaluationCompletionTokens)
        try container.encodeIfPresent(self.structuredOutput, forKey: .structuredOutput)
        try container.encodeIfPresent(self.structuredOutputPromptTokens, forKey: .structuredOutputPromptTokens)
        try container.encodeIfPresent(self.structuredOutputCompletionTokens, forKey: .structuredOutputCompletionTokens)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case summary
        case summaryPromptTokens
        case summaryCompletionTokens
        case structuredData
        case structuredDataPromptTokens
        case structuredDataCompletionTokens
        case successEvaluation
        case successEvaluationPromptTokens
        case successEvaluationCompletionTokens
        case structuredOutput
        case structuredOutputPromptTokens
        case structuredOutputCompletionTokens
    }
}