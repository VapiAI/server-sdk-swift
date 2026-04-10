import Foundation

public struct SimulationRunItemImprovementSuggestion: Codable, Hashable, Sendable {
    /// This is the issue identified.
    public let issue: String
    /// This is the suggested improvement.
    public let suggestion: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        issue: String,
        suggestion: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.issue = issue
        self.suggestion = suggestion
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.issue = try container.decode(String.self, forKey: .issue)
        self.suggestion = try container.decode(String.self, forKey: .suggestion)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.issue, forKey: .issue)
        try container.encode(self.suggestion, forKey: .suggestion)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case issue
        case suggestion
    }
}