import Foundation

public struct StructuredOutputCostBreakdown: Codable, Hashable, Sendable {
    /// This is the unique identifier of the structured output that produced this cost.
    public let structuredOutputId: String
    /// This is the name of the structured output, so this breakdown is readable without looking the id up.
    public let name: String
    /// This is the cost in USD of evaluating this structured output.
    public let cost: Double
    /// This is the number of prompt tokens used to evaluate this structured output.
    public let promptTokens: Double
    /// This is the number of completion tokens generated for this structured output.
    public let completionTokens: Double
    /// This is the number of cached prompt tokens used to evaluate this structured output. This is a subset of `promptTokens`, not an addition to it.
    public let cachedPromptTokens: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        structuredOutputId: String,
        name: String,
        cost: Double,
        promptTokens: Double,
        completionTokens: Double,
        cachedPromptTokens: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.structuredOutputId = structuredOutputId
        self.name = name
        self.cost = cost
        self.promptTokens = promptTokens
        self.completionTokens = completionTokens
        self.cachedPromptTokens = cachedPromptTokens
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.structuredOutputId = try container.decode(String.self, forKey: .structuredOutputId)
        self.name = try container.decode(String.self, forKey: .name)
        self.cost = try container.decode(Double.self, forKey: .cost)
        self.promptTokens = try container.decode(Double.self, forKey: .promptTokens)
        self.completionTokens = try container.decode(Double.self, forKey: .completionTokens)
        self.cachedPromptTokens = try container.decodeIfPresent(Double.self, forKey: .cachedPromptTokens)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.structuredOutputId, forKey: .structuredOutputId)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.cost, forKey: .cost)
        try container.encode(self.promptTokens, forKey: .promptTokens)
        try container.encode(self.completionTokens, forKey: .completionTokens)
        try container.encodeIfPresent(self.cachedPromptTokens, forKey: .cachedPromptTokens)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case structuredOutputId
        case name
        case cost
        case promptTokens
        case completionTokens
        case cachedPromptTokens
    }
}