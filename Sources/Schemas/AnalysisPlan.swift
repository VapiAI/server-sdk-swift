import Foundation

public struct AnalysisPlan: Codable, Hashable, Sendable {
    /// The minimum number of messages required to run the analysis plan.
    /// If the number of messages is less than this, analysis will be skipped.
    /// @default 2
    public let minMessagesThreshold: Double?
    /// This is the plan for generating the summary of the call. This outputs to `call.analysis.summary`.
    public let summaryPlan: SummaryPlan?
    /// This is the plan for generating the structured data from the call. This outputs to `call.analysis.structuredData`.
    public let structuredDataPlan: StructuredDataPlan?
    /// This is an array of structured data plan catalogs. Each entry includes a `key` and a `plan` for generating the structured data from the call. This outputs to `call.analysis.structuredDataMulti`.
    public let structuredDataMultiPlan: [StructuredDataMultiPlan]?
    /// This is the plan for generating the success evaluation of the call. This outputs to `call.analysis.successEvaluation`.
    public let successEvaluationPlan: SuccessEvaluationPlan?
    /// This is an array of outcome UUIDs to be calculated during analysis.
    /// The outcomes will be calculated and stored in `call.analysis.outcomes`.
    public let outcomeIds: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        minMessagesThreshold: Double? = nil,
        summaryPlan: SummaryPlan? = nil,
        structuredDataPlan: StructuredDataPlan? = nil,
        structuredDataMultiPlan: [StructuredDataMultiPlan]? = nil,
        successEvaluationPlan: SuccessEvaluationPlan? = nil,
        outcomeIds: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.minMessagesThreshold = minMessagesThreshold
        self.summaryPlan = summaryPlan
        self.structuredDataPlan = structuredDataPlan
        self.structuredDataMultiPlan = structuredDataMultiPlan
        self.successEvaluationPlan = successEvaluationPlan
        self.outcomeIds = outcomeIds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.minMessagesThreshold = try container.decodeIfPresent(Double.self, forKey: .minMessagesThreshold)
        self.summaryPlan = try container.decodeIfPresent(SummaryPlan.self, forKey: .summaryPlan)
        self.structuredDataPlan = try container.decodeIfPresent(StructuredDataPlan.self, forKey: .structuredDataPlan)
        self.structuredDataMultiPlan = try container.decodeIfPresent([StructuredDataMultiPlan].self, forKey: .structuredDataMultiPlan)
        self.successEvaluationPlan = try container.decodeIfPresent(SuccessEvaluationPlan.self, forKey: .successEvaluationPlan)
        self.outcomeIds = try container.decodeIfPresent([String].self, forKey: .outcomeIds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.minMessagesThreshold, forKey: .minMessagesThreshold)
        try container.encodeIfPresent(self.summaryPlan, forKey: .summaryPlan)
        try container.encodeIfPresent(self.structuredDataPlan, forKey: .structuredDataPlan)
        try container.encodeIfPresent(self.structuredDataMultiPlan, forKey: .structuredDataMultiPlan)
        try container.encodeIfPresent(self.successEvaluationPlan, forKey: .successEvaluationPlan)
        try container.encodeIfPresent(self.outcomeIds, forKey: .outcomeIds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case minMessagesThreshold
        case summaryPlan
        case structuredDataPlan
        case structuredDataMultiPlan
        case successEvaluationPlan
        case outcomeIds
    }
}