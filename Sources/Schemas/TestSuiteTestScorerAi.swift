import Foundation

public struct TestSuiteTestScorerAi: Codable, Hashable, Sendable {
    /// This is the type of the scorer, which must be AI.
    public let type: Ai
    /// This is the rubric used by the AI scorer.
    public let rubric: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: Ai,
        rubric: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.rubric = rubric
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(Ai.self, forKey: .type)
        self.rubric = try container.decode(String.self, forKey: .rubric)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.rubric, forKey: .rubric)
    }

    public enum Ai: String, Codable, Hashable, CaseIterable, Sendable {
        case ai
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case rubric
    }
}