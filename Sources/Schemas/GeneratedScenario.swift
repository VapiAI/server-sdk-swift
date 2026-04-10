import Foundation

public struct GeneratedScenario: Codable, Hashable, Sendable {
    /// Short descriptive name
    public let name: String
    /// Instructions for the tester
    public let instructions: String
    /// Scenario category
    public let category: GeneratedScenarioCategory
    /// Why this scenario is valuable
    public let reasoning: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        instructions: String,
        category: GeneratedScenarioCategory,
        reasoning: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.instructions = instructions
        self.category = category
        self.reasoning = reasoning
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.instructions = try container.decode(String.self, forKey: .instructions)
        self.category = try container.decode(GeneratedScenarioCategory.self, forKey: .category)
        self.reasoning = try container.decode(String.self, forKey: .reasoning)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.instructions, forKey: .instructions)
        try container.encode(self.category, forKey: .category)
        try container.encode(self.reasoning, forKey: .reasoning)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case instructions
        case category
        case reasoning
    }
}