import Foundation

public struct ExactReplacement: Codable, Hashable, Sendable {
    /// This option let's you control whether to replace all instances of the key or only the first one. By default, it only replaces the first instance.
    /// Examples:
    /// - For { type: 'exact', key: 'hello', value: 'hi', replaceAllEnabled: false }. Before: "hello world, hello universe" | After: "hi world, hello universe"
    /// - For { type: 'exact', key: 'hello', value: 'hi', replaceAllEnabled: true }. Before: "hello world, hello universe" | After: "hi world, hi universe"
    /// @default false
    public let replaceAllEnabled: Bool?
    /// This is the key to replace.
    public let key: String
    /// This is the value that will replace the match.
    public let value: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        replaceAllEnabled: Bool? = nil,
        key: String,
        value: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.replaceAllEnabled = replaceAllEnabled
        self.key = key
        self.value = value
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.replaceAllEnabled = try container.decodeIfPresent(Bool.self, forKey: .replaceAllEnabled)
        self.key = try container.decode(String.self, forKey: .key)
        self.value = try container.decode(String.self, forKey: .value)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.replaceAllEnabled, forKey: .replaceAllEnabled)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.value, forKey: .value)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case replaceAllEnabled
        case key
        case value
    }
}