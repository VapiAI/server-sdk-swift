import Foundation

public struct ModelCostServiceTierBreakdown: Codable, Hashable, Sendable {
    /// This is the service tier OpenAI reported serving a request that asked for Fast mode, in Vapi's names: `fast` when Fast mode was served, otherwise the tier served, such as `default`. It is absent on the row for usage with no reported tier: requests that did not ask for Fast mode, requests that ended before OpenAI reported a tier, and other providers.
    public let serviceTier: String?
    /// This is the cost in USD of the usage at this tier, rounded to 8 decimal places.
    public let cost: Double
    /// This is the number of prompt tokens used at this tier.
    public let promptTokens: Double
    /// This is the number of completion tokens generated at this tier.
    public let completionTokens: Double
    /// This is the number of cached prompt tokens used at this tier. This is a subset of `promptTokens`, not an addition to it.
    public let cachedPromptTokens: Double?
    /// This is the number of reasoning tokens generated at this tier. This is a subset of `completionTokens`, not an addition to it.
    public let reasoningTokens: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        serviceTier: String? = nil,
        cost: Double,
        promptTokens: Double,
        completionTokens: Double,
        cachedPromptTokens: Double? = nil,
        reasoningTokens: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.serviceTier = serviceTier
        self.cost = cost
        self.promptTokens = promptTokens
        self.completionTokens = completionTokens
        self.cachedPromptTokens = cachedPromptTokens
        self.reasoningTokens = reasoningTokens
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.serviceTier = try container.decodeIfPresent(String.self, forKey: .serviceTier)
        self.cost = try container.decode(Double.self, forKey: .cost)
        self.promptTokens = try container.decode(Double.self, forKey: .promptTokens)
        self.completionTokens = try container.decode(Double.self, forKey: .completionTokens)
        self.cachedPromptTokens = try container.decodeIfPresent(Double.self, forKey: .cachedPromptTokens)
        self.reasoningTokens = try container.decodeIfPresent(Double.self, forKey: .reasoningTokens)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.serviceTier, forKey: .serviceTier)
        try container.encode(self.cost, forKey: .cost)
        try container.encode(self.promptTokens, forKey: .promptTokens)
        try container.encode(self.completionTokens, forKey: .completionTokens)
        try container.encodeIfPresent(self.cachedPromptTokens, forKey: .cachedPromptTokens)
        try container.encodeIfPresent(self.reasoningTokens, forKey: .reasoningTokens)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case serviceTier
        case cost
        case promptTokens
        case completionTokens
        case cachedPromptTokens
        case reasoningTokens
    }
}