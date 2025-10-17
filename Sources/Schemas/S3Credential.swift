import Foundation

public struct S3Credential: Codable, Hashable, Sendable {
    /// Credential provider. Only allowed value is s3
    public let provider: S3
    /// AWS access key ID.
    public let awsAccessKeyId: String
    /// AWS access key secret. This is not returned in the API.
    public let awsSecretAccessKey: String
    /// AWS region in which the S3 bucket is located.
    public let region: String
    /// AWS S3 bucket name.
    public let s3BucketName: String
    /// The path prefix for the uploaded recording. Ex. "recordings/"
    public let s3PathPrefix: String
    /// This is the order in which this storage provider is tried during upload retries. Lower numbers are tried first in increasing order.
    public let fallbackIndex: Double?
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
        provider: S3,
        awsAccessKeyId: String,
        awsSecretAccessKey: String,
        region: String,
        s3BucketName: String,
        s3PathPrefix: String,
        fallbackIndex: Double? = nil,
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.awsAccessKeyId = awsAccessKeyId
        self.awsSecretAccessKey = awsSecretAccessKey
        self.region = region
        self.s3BucketName = s3BucketName
        self.s3PathPrefix = s3PathPrefix
        self.fallbackIndex = fallbackIndex
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decode(S3.self, forKey: .provider)
        self.awsAccessKeyId = try container.decode(String.self, forKey: .awsAccessKeyId)
        self.awsSecretAccessKey = try container.decode(String.self, forKey: .awsSecretAccessKey)
        self.region = try container.decode(String.self, forKey: .region)
        self.s3BucketName = try container.decode(String.self, forKey: .s3BucketName)
        self.s3PathPrefix = try container.decode(String.self, forKey: .s3PathPrefix)
        self.fallbackIndex = try container.decodeIfPresent(Double.self, forKey: .fallbackIndex)
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
        try container.encode(self.awsAccessKeyId, forKey: .awsAccessKeyId)
        try container.encode(self.awsSecretAccessKey, forKey: .awsSecretAccessKey)
        try container.encode(self.region, forKey: .region)
        try container.encode(self.s3BucketName, forKey: .s3BucketName)
        try container.encode(self.s3PathPrefix, forKey: .s3PathPrefix)
        try container.encodeIfPresent(self.fallbackIndex, forKey: .fallbackIndex)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    public enum S3: String, Codable, Hashable, CaseIterable, Sendable {
        case s3
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case awsAccessKeyId
        case awsSecretAccessKey
        case region
        case s3BucketName
        case s3PathPrefix
        case fallbackIndex
        case id
        case orgId
        case createdAt
        case updatedAt
        case name
    }
}