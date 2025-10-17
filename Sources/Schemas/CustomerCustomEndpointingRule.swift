import Foundation

public struct CustomerCustomEndpointingRule: Codable, Hashable, Sendable {
    /// This is the regex pattern to match.
    /// 
    /// Note:
    /// - This works by using the `RegExp.test` method in Node.JS. Eg. `/hello/.test("hello there")` will return `true`.
    /// 
    /// Hot tip:
    /// - In JavaScript, escape `\` when sending the regex pattern. Eg. `"hello\sthere"` will be sent over the wire as `"hellosthere"`. Send `"hello\\sthere"` instead.
    /// - `RegExp.test` does substring matching, so `/cat/.test("I love cats")` will return `true`. To do full string matching, send "^cat$".
    public let regex: String
    /// These are the options for the regex match. Defaults to all disabled.
    /// 
    /// @default []
    public let regexOptions: [RegexOption]?
    /// This is the endpointing timeout in seconds, if the rule is matched.
    public let timeoutSeconds: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        regex: String,
        regexOptions: [RegexOption]? = nil,
        timeoutSeconds: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.regex = regex
        self.regexOptions = regexOptions
        self.timeoutSeconds = timeoutSeconds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.regex = try container.decode(String.self, forKey: .regex)
        self.regexOptions = try container.decodeIfPresent([RegexOption].self, forKey: .regexOptions)
        self.timeoutSeconds = try container.decode(Double.self, forKey: .timeoutSeconds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.regex, forKey: .regex)
        try container.encodeIfPresent(self.regexOptions, forKey: .regexOptions)
        try container.encode(self.timeoutSeconds, forKey: .timeoutSeconds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case regex
        case regexOptions
        case timeoutSeconds
    }
}