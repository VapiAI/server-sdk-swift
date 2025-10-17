import Foundation

public struct RegexOption: Codable, Hashable, Sendable {
    /// This is the type of the regex option. Options are:
    /// - `ignore-case`: Ignores the case of the text being matched. Add
    /// - `whole-word`: Matches whole words only.
    /// - `multi-line`: Matches across multiple lines.
    public let type: RegexOptionType
    /// This is whether to enable the option.
    /// 
    /// @default false
    public let enabled: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: RegexOptionType,
        enabled: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.enabled = enabled
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(RegexOptionType.self, forKey: .type)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.enabled, forKey: .enabled)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case enabled
    }
}