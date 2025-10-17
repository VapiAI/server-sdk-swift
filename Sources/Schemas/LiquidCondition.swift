import Foundation

public struct LiquidCondition: Codable, Hashable, Sendable {
    /// This is the Liquid template that must return exactly "true" or "false" as a string.
    /// The template is evaluated and the entire output must be either "true" or "false" - nothing else.
    /// 
    /// Available variables:
    /// - `messages`: Array of recent messages in OpenAI chat completions format (ChatCompletionMessageParam[])
    ///   Each message has properties like: role ('user', 'assistant', 'system'), content (string), etc.
    /// - `now`: Current timestamp in milliseconds (built-in Liquid variable)
    /// - Any assistant variable values (e.g., `userName`, `accountStatus`)
    /// 
    /// Useful Liquid filters for messages:
    /// - `messages | last: 5` - Get the 5 most recent messages
    /// - `messages | where: 'role', 'user'` - Filter to only user messages
    /// - `messages | reverse` - Reverse the order of messages
    public let liquid: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        liquid: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.liquid = liquid
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.liquid = try container.decode(String.self, forKey: .liquid)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.liquid, forKey: .liquid)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case liquid
    }
}