import Foundation

public struct PhoneNumberCallEndingHookFilter: Codable, Hashable, Sendable {
    /// This is the type of filter - currently only "oneOf" is supported
    public let type: OneOf
    /// This is the key to filter on - only "call.endedReason" is allowed for phone number call ending hooks
    public let key: CallEndedReason
    /// This is the array of assistant-request related ended reasons to match against
    public let oneOf: [PhoneNumberCallEndingHookFilterOneOfItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: OneOf,
        key: CallEndedReason,
        oneOf: [PhoneNumberCallEndingHookFilterOneOfItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.key = key
        self.oneOf = oneOf
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(OneOf.self, forKey: .type)
        self.key = try container.decode(CallEndedReason.self, forKey: .key)
        self.oneOf = try container.decode([PhoneNumberCallEndingHookFilterOneOfItem].self, forKey: .oneOf)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.oneOf, forKey: .oneOf)
    }

    public enum OneOf: String, Codable, Hashable, CaseIterable, Sendable {
        case oneOf
    }

    public enum CallEndedReason: String, Codable, Hashable, CaseIterable, Sendable {
        case callEndedReason = "call.endedReason"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case key
        case oneOf
    }
}