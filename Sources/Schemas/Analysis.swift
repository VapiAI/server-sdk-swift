import Foundation

public struct Analysis: Codable, Hashable, Sendable {
    /// This is the summary of the call. Customize by setting `assistant.analysisPlan.summaryPrompt`.
    public let summary: String?
    /// This is the structured data extracted from the call. Customize by setting `assistant.analysisPlan.structuredDataPrompt` and/or `assistant.analysisPlan.structuredDataSchema`.
    public let structuredData: [String: JSONValue]?
    /// This is the structured data catalog of the call. Customize by setting `assistant.analysisPlan.structuredDataMultiPlan`.
    public let structuredDataMulti: [[String: JSONValue]]?
    /// This is the evaluation of the call. Customize by setting `assistant.analysisPlan.successEvaluationPrompt` and/or `assistant.analysisPlan.successEvaluationRubric`.
    public let successEvaluation: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        summary: String? = nil,
        structuredData: [String: JSONValue]? = nil,
        structuredDataMulti: [[String: JSONValue]]? = nil,
        successEvaluation: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.summary = summary
        self.structuredData = structuredData
        self.structuredDataMulti = structuredDataMulti
        self.successEvaluation = successEvaluation
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.summary = try container.decodeIfPresent(String.self, forKey: .summary)
        self.structuredData = try container.decodeIfPresent([String: JSONValue].self, forKey: .structuredData)
        self.structuredDataMulti = try container.decodeIfPresent([[String: JSONValue]].self, forKey: .structuredDataMulti)
        self.successEvaluation = try container.decodeIfPresent(String.self, forKey: .successEvaluation)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.summary, forKey: .summary)
        try container.encodeIfPresent(self.structuredData, forKey: .structuredData)
        try container.encodeIfPresent(self.structuredDataMulti, forKey: .structuredDataMulti)
        try container.encodeIfPresent(self.successEvaluation, forKey: .successEvaluation)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case summary
        case structuredData
        case structuredDataMulti
        case successEvaluation
    }
}