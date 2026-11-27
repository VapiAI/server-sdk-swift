import Foundation

public struct GoalEvaluationCurrentBatchRequestDto: Codable, Hashable, Sendable {
    /// Explicit call/goal pairs. The organization comes from the authenticated caller.
    public let evaluations: [GoalEvaluationCurrentCallRequestDto]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        evaluations: [GoalEvaluationCurrentCallRequestDto],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.evaluations = evaluations
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.evaluations = try container.decode([GoalEvaluationCurrentCallRequestDto].self, forKey: .evaluations)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.evaluations, forKey: .evaluations)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case evaluations
    }
}