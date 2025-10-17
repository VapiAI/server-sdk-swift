import Foundation

public struct RegexSecurityFilter: Codable, Hashable, Sendable {
    /// The type of security threat to filter.
    public let type: Regex
    /// The regex pattern to filter.
    public let regex: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: Regex,
        regex: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.regex = regex
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(Regex.self, forKey: .type)
        self.regex = try container.decode(String.self, forKey: .regex)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.regex, forKey: .regex)
    }

    public enum Regex: String, Codable, Hashable, CaseIterable, Sendable {
        case regex
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case regex
    }
}