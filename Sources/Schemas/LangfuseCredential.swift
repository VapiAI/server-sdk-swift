import Foundation

public struct LangfuseCredential: Codable, Hashable, Sendable {
    public let provider: LangfuseCredentialProvider
    /// The public key for Langfuse project. Eg: pk-lf-...
    public let publicKey: String
    /// The secret key for Langfuse project. Eg: sk-lf-... .This is not returned in the API.
    public let apiKey: String
    /// The host URL for Langfuse project. Eg: https://cloud.langfuse.com
    public let apiUrl: String
    /// The semver version of your Langfuse server, e.g. 3.63.0, as its /api/public/health endpoint reports it. Optional.
    public let serverVersion: String?
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
        provider: LangfuseCredentialProvider,
        publicKey: String,
        apiKey: String,
        apiUrl: String,
        serverVersion: String? = nil,
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.publicKey = publicKey
        self.apiKey = apiKey
        self.apiUrl = apiUrl
        self.serverVersion = serverVersion
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decode(LangfuseCredentialProvider.self, forKey: .provider)
        self.publicKey = try container.decode(String.self, forKey: .publicKey)
        self.apiKey = try container.decode(String.self, forKey: .apiKey)
        self.apiUrl = try container.decode(String.self, forKey: .apiUrl)
        self.serverVersion = try container.decodeIfPresent(String.self, forKey: .serverVersion)
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
        try container.encode(self.publicKey, forKey: .publicKey)
        try container.encode(self.apiKey, forKey: .apiKey)
        try container.encode(self.apiUrl, forKey: .apiUrl)
        try container.encodeIfPresent(self.serverVersion, forKey: .serverVersion)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case publicKey
        case apiKey
        case apiUrl
        case serverVersion
        case id
        case orgId
        case createdAt
        case updatedAt
        case name
    }
}