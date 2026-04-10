import Foundation

public struct GenerateScenariosResponse: Codable, Hashable, Sendable {
    /// Generated scenarios
    public let scenarios: [GeneratedScenario]
    /// Summary of test coverage
    public let coverageNotes: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        scenarios: [GeneratedScenario],
        coverageNotes: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.scenarios = scenarios
        self.coverageNotes = coverageNotes
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.scenarios = try container.decode([GeneratedScenario].self, forKey: .scenarios)
        self.coverageNotes = try container.decode(String.self, forKey: .coverageNotes)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.scenarios, forKey: .scenarios)
        try container.encode(self.coverageNotes, forKey: .coverageNotes)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case scenarios
        case coverageNotes
    }
}