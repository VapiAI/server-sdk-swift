import Foundation

public struct CustomLlmCredential: Codable, Hashable, Sendable {
    public let provider: CustomLlm
    /// This is not returned in the API.
    public let apiKey: String
    /// This is the authentication plan. Currently supports OAuth2 RFC 6749. To use Bearer authentication, use apiKey
    public let authenticationPlan: OAuth2AuthenticationPlan?
    /// This is the unique identifier for the credential.
    public let id: String
    /// This is the unique identifier for the org that this credential belongs to.
    public let orgId: String
    /// This is the ISO 8601 date-time string of when the credential was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the assistant was last updated.
    public let updatedAt: Date
    /// This is the authentication session for the credential. Available for credentials that have an authentication plan.
    public let authenticationSession: Oauth2AuthenticationSession?
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: CustomLlm,
        apiKey: String,
        authenticationPlan: OAuth2AuthenticationPlan? = nil,
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        authenticationSession: Oauth2AuthenticationSession? = nil,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.apiKey = apiKey
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
        self.provider = try container.decode(CustomLlm.self, forKey: .provider)
        self.apiKey = try container.decode(String.self, forKey: .apiKey)
        self.authenticationPlan = try container.decodeIfPresent(OAuth2AuthenticationPlan.self, forKey: .authenticationPlan)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.authenticationSession = try container.decodeIfPresent(Oauth2AuthenticationSession.self, forKey: .authenticationSession)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.provider, forKey: .provider)
        try container.encode(self.apiKey, forKey: .apiKey)
        try container.encodeIfPresent(self.authenticationPlan, forKey: .authenticationPlan)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(self.authenticationSession, forKey: .authenticationSession)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    public enum CustomLlm: String, Codable, Hashable, CaseIterable, Sendable {
        case customLlm = "custom-llm"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case apiKey
        case authenticationPlan
        case id
        case orgId
        case createdAt
        case updatedAt
        case authenticationSession
        case name
    }
}