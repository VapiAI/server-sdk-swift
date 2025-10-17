import Foundation

public struct TwilioCredential: Codable, Hashable, Sendable {
    public let provider: Twilio
    /// This is not returned in the API.
    public let authToken: String?
    /// This is not returned in the API.
    public let apiKey: String?
    /// This is not returned in the API.
    public let apiSecret: String?
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
    public let accountSid: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: Twilio,
        authToken: String? = nil,
        apiKey: String? = nil,
        apiSecret: String? = nil,
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        name: String? = nil,
        accountSid: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.authToken = authToken
        self.apiKey = apiKey
        self.apiSecret = apiSecret
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.accountSid = accountSid
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decode(Twilio.self, forKey: .provider)
        self.authToken = try container.decodeIfPresent(String.self, forKey: .authToken)
        self.apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
        self.apiSecret = try container.decodeIfPresent(String.self, forKey: .apiSecret)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.accountSid = try container.decode(String.self, forKey: .accountSid)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.authToken, forKey: .authToken)
        try container.encodeIfPresent(self.apiKey, forKey: .apiKey)
        try container.encodeIfPresent(self.apiSecret, forKey: .apiSecret)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(self.accountSid, forKey: .accountSid)
    }

    public enum Twilio: String, Codable, Hashable, CaseIterable, Sendable {
        case twilio
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case authToken
        case apiKey
        case apiSecret
        case id
        case orgId
        case createdAt
        case updatedAt
        case name
        case accountSid
    }
}