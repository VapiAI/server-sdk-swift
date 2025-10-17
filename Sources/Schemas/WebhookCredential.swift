import Foundation

public struct WebhookCredential: Codable, Hashable, Sendable {
    public let provider: Webhook
    /// This is the authentication plan. Supports OAuth2 RFC 6749, HMAC signing, and Bearer authentication.
    public let authenticationPlan: WebhookCredentialAuthenticationPlan
    /// This is the unique identifier for the credential.
    public let id: String
    /// This is the unique identifier for the org that this credential belongs to.
    public let orgId: String
    /// This is the ISO 8601 date-time string of when the credential was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the assistant was last updated.
    public let updatedAt: Date
    /// This is the authentication session for the credential. Available for credentials that have an authentication plan.
    public let authenticationSession: Oauth2AuthenticationSession
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: Webhook,
        authenticationPlan: WebhookCredentialAuthenticationPlan,
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        authenticationSession: Oauth2AuthenticationSession,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.authenticationPlan = authenticationPlan
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.authenticationSession = authenticationSession
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decode(Webhook.self, forKey: .provider)
        self.authenticationPlan = try container.decode(WebhookCredentialAuthenticationPlan.self, forKey: .authenticationPlan)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.authenticationSession = try container.decode(Oauth2AuthenticationSession.self, forKey: .authenticationSession)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.provider, forKey: .provider)
        try container.encode(self.authenticationPlan, forKey: .authenticationPlan)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.authenticationSession, forKey: .authenticationSession)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    public enum Webhook: String, Codable, Hashable, CaseIterable, Sendable {
        case webhook
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case authenticationPlan
        case id
        case orgId
        case createdAt
        case updatedAt
        case authenticationSession
        case name
    }
}