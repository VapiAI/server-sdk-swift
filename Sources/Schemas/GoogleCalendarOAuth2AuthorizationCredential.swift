import Foundation

public struct GoogleCalendarOAuth2AuthorizationCredential: Codable, Hashable, Sendable {
    public let provider: GoogleCalendarOauth2Authorization
    /// The authorization ID for the OAuth2 authorization
    public let authorizationId: String
    /// This is the unique identifier for the credential.
    public let id: String
    /// This is the unique identifier for the org that this credential belongs to.
    public let orgId: String
    /// This is the ISO 8601 date-time string of when the credential was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the assistant was last updated.
    public let updatedAt: Date
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: GoogleCalendarOauth2Authorization,
        authorizationId: String,
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.authorizationId = authorizationId
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decode(GoogleCalendarOauth2Authorization.self, forKey: .provider)
        self.authorizationId = try container.decode(String.self, forKey: .authorizationId)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.provider, forKey: .provider)
        try container.encode(self.authorizationId, forKey: .authorizationId)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    public enum GoogleCalendarOauth2Authorization: String, Codable, Hashable, CaseIterable, Sendable {
        case googleCalendarOauth2Authorization = "google.calendar.oauth2-authorization"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case authorizationId
        case id
        case orgId
        case createdAt
        case updatedAt
        case name
    }
}