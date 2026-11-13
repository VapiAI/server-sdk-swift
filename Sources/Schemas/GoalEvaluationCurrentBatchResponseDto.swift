import Foundation

public struct GoalEvaluationCurrentBatchResponseDto: Codable, Hashable, Sendable {
    /// One entry per requested call/goal pair, in request order, including entries without a current evaluation.
    public let results: [GoalEvaluationCurrentCallResponseDto]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        results: [GoalEvaluationCurrentCallResponseDto],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.results = results
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decode([GoalEvaluationCurrentCallResponseDto].self, forKey: .results)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.results, forKey: .results)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case results
    }
}