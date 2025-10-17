import Foundation

public struct RegexReplacement: Codable, Hashable, Sendable {
    /// This is the regex pattern to replace.
    /// 
    /// Note:
    /// - This works by using the `string.replace` method in Node.JS. Eg. `"hello there".replace(/hello/g, "hi")` will return `"hi there"`.
    /// 
    /// Hot tip:
    /// - In JavaScript, escape `\` when sending the regex pattern. Eg. `"hello\sthere"` will be sent over the wire as `"hellosthere"`. Send `"hello\\sthere"` instead.
    public let regex: String
    /// These are the options for the regex replacement. Defaults to all disabled.
    /// 
    /// @default []
    public let options: [RegexOption]?
    /// This is the value that will replace the match.
    public let value: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        regex: String,
        options: [RegexOption]? = nil,
        value: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.regex = regex
        self.options = options
        self.value = value
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.regex = try container.decode(String.self, forKey: .regex)
        self.options = try container.decodeIfPresent([RegexOption].self, forKey: .options)
        self.value = try container.decode(String.self, forKey: .value)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.regex, forKey: .regex)
        try container.encodeIfPresent(self.options, forKey: .options)
        try container.encode(self.value, forKey: .value)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case regex
        case options
        case value
    }
}