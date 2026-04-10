import Foundation

public struct CredentialEndUser: Codable, Hashable, Sendable {
    public let endUserEmail: Nullable<String>?
    public let endUserId: String
    public let organizationId: String
    public let tags: [String: JSONValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        endUserEmail: Nullable<String>? = nil,
        endUserId: String,
        organizationId: String,
        tags: [String: JSONValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.endUserEmail = endUserEmail
        self.endUserId = endUserId
        self.organizationId = organizationId
        self.tags = tags
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.endUserEmail = try container.decodeNullableIfPresent(String.self, forKey: .endUserEmail)
        self.endUserId = try container.decode(String.self, forKey: .endUserId)
        self.organizationId = try container.decode(String.self, forKey: .organizationId)
        self.tags = try container.decodeIfPresent([String: JSONValue].self, forKey: .tags)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.endUserEmail, forKey: .endUserEmail)
        try container.encode(self.endUserId, forKey: .endUserId)
        try container.encode(self.organizationId, forKey: .organizationId)
        try container.encodeIfPresent(self.tags, forKey: .tags)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case endUserEmail
        case endUserId
        case organizationId
        case tags
    }
}