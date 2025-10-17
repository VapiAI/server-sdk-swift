import Foundation

public struct KnowledgeBaseCost: Codable, Hashable, Sendable {
    /// This is the model that was used for processing the knowledge base.
    public let model: [String: JSONValue]
    /// This is the number of prompt tokens used in the knowledge base query.
    public let promptTokens: Double
    /// This is the number of completion tokens generated in the knowledge base query.
    public let completionTokens: Double
    /// This is the cost of the component in USD.
    public let cost: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        model: [String: JSONValue],
        promptTokens: Double,
        completionTokens: Double,
        cost: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.model = model
        self.promptTokens = promptTokens
        self.completionTokens = completionTokens
        self.cost = cost
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.model = try container.decode([String: JSONValue].self, forKey: .model)
        self.promptTokens = try container.decode(Double.self, forKey: .promptTokens)
        self.completionTokens = try container.decode(Double.self, forKey: .completionTokens)
        self.cost = try container.decode(Double.self, forKey: .cost)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.model, forKey: .model)
        try container.encode(self.promptTokens, forKey: .promptTokens)
        try container.encode(self.completionTokens, forKey: .completionTokens)
        try container.encode(self.cost, forKey: .cost)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case model
        case promptTokens
        case completionTokens
        case cost
    }
}