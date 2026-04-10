import Foundation

public struct AnthropicThinkingConfig: Codable, Hashable, Sendable {
    public let type: AnthropicThinkingConfigType
    /// The maximum number of tokens to allocate for thinking.
    /// Must be between 1024 and 100000 tokens.
    public let budgetTokens: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: AnthropicThinkingConfigType,
        budgetTokens: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.budgetTokens = budgetTokens
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(AnthropicThinkingConfigType.self, forKey: .type)
        self.budgetTokens = try container.decode(Double.self, forKey: .budgetTokens)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.budgetTokens, forKey: .budgetTokens)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case budgetTokens
    }
}