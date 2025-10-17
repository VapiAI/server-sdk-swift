import Foundation

public struct BothCustomEndpointingRule: Codable, Hashable, Sendable {
    /// This is the regex pattern to match the assistant's message.
    /// 
    /// Note:
    /// - This works by using the `RegExp.test` method in Node.JS. Eg. `/hello/.test("hello there")` will return `true`.
    /// 
    /// Hot tip:
    /// - In JavaScript, escape `\` when sending the regex pattern. Eg. `"hello\sthere"` will be sent over the wire as `"hellosthere"`. Send `"hello\\sthere"` instead.
    /// - `RegExp.test` does substring matching, so `/cat/.test("I love cats")` will return `true`. To do full string matching, send "^cat$".
    public let assistantRegex: String
    /// These are the options for the assistant's message regex match. Defaults to all disabled.
    /// 
    /// @default []
    public let assistantRegexOptions: [RegexOption]?
    public let customerRegex: String
    /// These are the options for the customer's message regex match. Defaults to all disabled.
    /// 
    /// @default []
    public let customerRegexOptions: [RegexOption]?
    /// This is the endpointing timeout in seconds, if the rule is matched.
    public let timeoutSeconds: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        assistantRegex: String,
        assistantRegexOptions: [RegexOption]? = nil,
        customerRegex: String,
        customerRegexOptions: [RegexOption]? = nil,
        timeoutSeconds: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.assistantRegex = assistantRegex
        self.assistantRegexOptions = assistantRegexOptions
        self.customerRegex = customerRegex
        self.customerRegexOptions = customerRegexOptions
        self.timeoutSeconds = timeoutSeconds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assistantRegex = try container.decode(String.self, forKey: .assistantRegex)
        self.assistantRegexOptions = try container.decodeIfPresent([RegexOption].self, forKey: .assistantRegexOptions)
        self.customerRegex = try container.decode(String.self, forKey: .customerRegex)
        self.customerRegexOptions = try container.decodeIfPresent([RegexOption].self, forKey: .customerRegexOptions)
        self.timeoutSeconds = try container.decode(Double.self, forKey: .timeoutSeconds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.assistantRegex, forKey: .assistantRegex)
        try container.encodeIfPresent(self.assistantRegexOptions, forKey: .assistantRegexOptions)
        try container.encode(self.customerRegex, forKey: .customerRegex)
        try container.encodeIfPresent(self.customerRegexOptions, forKey: .customerRegexOptions)
        try container.encode(self.timeoutSeconds, forKey: .timeoutSeconds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case assistantRegex
        case assistantRegexOptions
        case customerRegex
        case customerRegexOptions
        case timeoutSeconds
    }
}