import Foundation

public struct GcpKey: Codable, Hashable, Sendable {
    /// This is the type of the key. Most likely, this is "service_account".
    public let type: String
    /// This is the ID of the Google Cloud project associated with this key.
    public let projectId: String
    /// This is the unique identifier for the private key.
    public let privateKeyId: String
    /// This is the private key in PEM format.
    /// 
    /// Note: This is not returned in the API.
    public let privateKey: String
    /// This is the email address associated with the service account.
    public let clientEmail: String
    /// This is the unique identifier for the client.
    public let clientId: String
    /// This is the URI for the auth provider's authorization endpoint.
    public let authUri: String
    /// This is the URI for the auth provider's token endpoint.
    public let tokenUri: String
    /// This is the URL of the public x509 certificate for the auth provider.
    public let authProviderX509CertUrl: String
    /// This is the URL of the public x509 certificate for the client.
    public let clientX509CertUrl: String
    /// This is the domain associated with the universe this service account belongs to.
    public let universeDomain: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: String,
        projectId: String,
        privateKeyId: String,
        privateKey: String,
        clientEmail: String,
        clientId: String,
        authUri: String,
        tokenUri: String,
        authProviderX509CertUrl: String,
        clientX509CertUrl: String,
        universeDomain: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.projectId = projectId
        self.privateKeyId = privateKeyId
        self.privateKey = privateKey
        self.clientEmail = clientEmail
        self.clientId = clientId
        self.authUri = authUri
        self.tokenUri = tokenUri
        self.authProviderX509CertUrl = authProviderX509CertUrl
        self.clientX509CertUrl = clientX509CertUrl
        self.universeDomain = universeDomain
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: .type)
        self.projectId = try container.decode(String.self, forKey: .projectId)
        self.privateKeyId = try container.decode(String.self, forKey: .privateKeyId)
        self.privateKey = try container.decode(String.self, forKey: .privateKey)
        self.clientEmail = try container.decode(String.self, forKey: .clientEmail)
        self.clientId = try container.decode(String.self, forKey: .clientId)
        self.authUri = try container.decode(String.self, forKey: .authUri)
        self.tokenUri = try container.decode(String.self, forKey: .tokenUri)
        self.authProviderX509CertUrl = try container.decode(String.self, forKey: .authProviderX509CertUrl)
        self.clientX509CertUrl = try container.decode(String.self, forKey: .clientX509CertUrl)
        self.universeDomain = try container.decode(String.self, forKey: .universeDomain)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.projectId, forKey: .projectId)
        try container.encode(self.privateKeyId, forKey: .privateKeyId)
        try container.encode(self.privateKey, forKey: .privateKey)
        try container.encode(self.clientEmail, forKey: .clientEmail)
        try container.encode(self.clientId, forKey: .clientId)
        try container.encode(self.authUri, forKey: .authUri)
        try container.encode(self.tokenUri, forKey: .tokenUri)
        try container.encode(self.authProviderX509CertUrl, forKey: .authProviderX509CertUrl)
        try container.encode(self.clientX509CertUrl, forKey: .clientX509CertUrl)
        try container.encode(self.universeDomain, forKey: .universeDomain)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case projectId
        case privateKeyId
        case privateKey
        case clientEmail
        case clientId
        case authUri
        case tokenUri
        case authProviderX509CertUrl
        case clientX509CertUrl
        case universeDomain
    }
}