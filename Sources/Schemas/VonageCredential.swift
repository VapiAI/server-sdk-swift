import Foundation

public struct VonageCredential: Codable, Hashable, Sendable {
    /// This is not returned in the API.
    public let vonageApplicationPrivateKey: String
    public let provider: Vonage
    /// This is not returned in the API.
    public let apiSecret: String
    /// This is the unique identifier for the credential.
    public let id: String
    /// This is the unique identifier for the org that this credential belongs to.
    public let orgId: String
    /// This is the ISO 8601 date-time string of when the credential was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the assistant was last updated.
    public let updatedAt: Date
    /// This is the Vonage Application ID for the credential.
    /// 
    /// Only relevant for Vonage credentials.
    public let vonageApplicationId: String
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    public let apiKey: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        vonageApplicationPrivateKey: String,
        provider: Vonage,
        apiSecret: String,
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        vonageApplicationId: String,
        name: String? = nil,
        apiKey: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.vonageApplicationPrivateKey = vonageApplicationPrivateKey
        self.provider = provider
        self.apiSecret = apiSecret
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.vonageApplicationId = vonageApplicationId
        self.name = name
        self.apiKey = apiKey
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.vonageApplicationPrivateKey = try container.decode(String.self, forKey: .vonageApplicationPrivateKey)
        self.provider = try container.decode(Vonage.self, forKey: .provider)
        self.apiSecret = try container.decode(String.self, forKey: .apiSecret)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.vonageApplicationId = try container.decode(String.self, forKey: .vonageApplicationId)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.apiKey = try container.decode(String.self, forKey: .apiKey)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.vonageApplicationPrivateKey, forKey: .vonageApplicationPrivateKey)
        try container.encode(self.provider, forKey: .provider)
        try container.encode(self.apiSecret, forKey: .apiSecret)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.vonageApplicationId, forKey: .vonageApplicationId)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(self.apiKey, forKey: .apiKey)
    }

    public enum Vonage: String, Codable, Hashable, CaseIterable, Sendable {
        case vonage
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case vonageApplicationPrivateKey
        case provider
        case apiSecret
        case id
        case orgId
        case createdAt
        case updatedAt
        case vonageApplicationId
        case name
        case apiKey
    }
}