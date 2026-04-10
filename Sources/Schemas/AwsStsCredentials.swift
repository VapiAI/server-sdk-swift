import Foundation

public struct AwsStsCredentials: Codable, Hashable, Sendable {
    /// This is the access key ID for the AWS credential
    public let accessKeyId: String?
    /// This is the expiration date for the AWS credential
    public let expiration: Date?
    /// This is the secret access key for the AWS credential
    public let secretAccessKey: String?
    /// This is the session token for the AWS credential
    public let sessionToken: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accessKeyId: String? = nil,
        expiration: Date? = nil,
        secretAccessKey: String? = nil,
        sessionToken: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accessKeyId = accessKeyId
        self.expiration = expiration
        self.secretAccessKey = secretAccessKey
        self.sessionToken = sessionToken
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accessKeyId = try container.decodeIfPresent(String.self, forKey: .accessKeyId)
        self.expiration = try container.decodeIfPresent(Date.self, forKey: .expiration)
        self.secretAccessKey = try container.decodeIfPresent(String.self, forKey: .secretAccessKey)
        self.sessionToken = try container.decodeIfPresent(String.self, forKey: .sessionToken)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.accessKeyId, forKey: .accessKeyId)
        try container.encodeIfPresent(self.expiration, forKey: .expiration)
        try container.encodeIfPresent(self.secretAccessKey, forKey: .secretAccessKey)
        try container.encodeIfPresent(self.sessionToken, forKey: .sessionToken)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accessKeyId = "AccessKeyId"
        case expiration = "Expiration"
        case secretAccessKey = "SecretAccessKey"
        case sessionToken = "SessionToken"
    }
}