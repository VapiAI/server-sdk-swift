import Foundation

public struct Token: Codable, Hashable, Sendable {
    /// This is the tag for the token. It represents its scope.
    public let tag: TokenTag?
    /// This is the unique identifier for the token.
    public let id: String
    /// This is unique identifier for the org that this token belongs to.
    public let orgId: String
    /// This is the ISO 8601 date-time string of when the token was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the token was last updated.
    public let updatedAt: Date
    /// This is the token key.
    public let value: String
    /// This is the name of the token. This is just for your own reference.
    public let name: String?
    /// This are the restrictions for the token.
    public let restrictions: TokenRestrictions?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        tag: TokenTag? = nil,
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        value: String,
        name: String? = nil,
        restrictions: TokenRestrictions? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.tag = tag
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.value = value
        self.name = name
        self.restrictions = restrictions
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.tag = try container.decodeIfPresent(TokenTag.self, forKey: .tag)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.value = try container.decode(String.self, forKey: .value)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.restrictions = try container.decodeIfPresent(TokenRestrictions.self, forKey: .restrictions)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.tag, forKey: .tag)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.value, forKey: .value)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.restrictions, forKey: .restrictions)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case tag
        case id
        case orgId
        case createdAt
        case updatedAt
        case value
        case name
        case restrictions
    }
}