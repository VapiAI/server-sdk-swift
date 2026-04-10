import Foundation

public struct PhoneNumberCallRingingHookFilter: Codable, Hashable, Sendable {
    /// This is the type of filter - matches when the specified field starts with any of the given prefixes
    public let type: PhoneNumberCallRingingHookFilterType
    /// The field to check. Currently only "number" (the caller's phone number) is supported.
    public let key: PhoneNumberCallRingingHookFilterKey
    /// Array of prefixes to match. Do not include the + prefix. Inbound calls from numbers starting with any of these prefixes will trigger the hook actions.
    public let startsWith: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: PhoneNumberCallRingingHookFilterType,
        key: PhoneNumberCallRingingHookFilterKey,
        startsWith: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.key = key
        self.startsWith = startsWith
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(PhoneNumberCallRingingHookFilterType.self, forKey: .type)
        self.key = try container.decode(PhoneNumberCallRingingHookFilterKey.self, forKey: .key)
        self.startsWith = try container.decode([String].self, forKey: .startsWith)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.startsWith, forKey: .startsWith)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case key
        case startsWith
    }
}