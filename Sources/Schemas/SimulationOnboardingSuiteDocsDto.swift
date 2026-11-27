import Foundation

public struct SimulationOnboardingSuiteDocsDto: Codable, Hashable, Sendable {
    /// Link to testing best practices.
    public let bestPractices: String
    /// Link explaining why tools are mocked by default.
    public let toolMocks: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bestPractices: String,
        toolMocks: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bestPractices = bestPractices
        self.toolMocks = toolMocks
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bestPractices = try container.decode(String.self, forKey: .bestPractices)
        self.toolMocks = try container.decode(String.self, forKey: .toolMocks)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.bestPractices, forKey: .bestPractices)
        try container.encode(self.toolMocks, forKey: .toolMocks)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bestPractices
        case toolMocks
    }
}