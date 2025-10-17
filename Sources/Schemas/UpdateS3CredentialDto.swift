import Foundation

public struct UpdateS3CredentialDto: Codable, Hashable, Sendable {
    /// AWS access key ID.
    public let awsAccessKeyId: String?
    /// AWS access key secret. This is not returned in the API.
    public let awsSecretAccessKey: String?
    /// AWS region in which the S3 bucket is located.
    public let region: String?
    /// AWS S3 bucket name.
    public let s3BucketName: String?
    /// The path prefix for the uploaded recording. Ex. "recordings/"
    public let s3PathPrefix: String?
    /// This is the order in which this storage provider is tried during upload retries. Lower numbers are tried first in increasing order.
    public let fallbackIndex: Double?
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        awsAccessKeyId: String? = nil,
        awsSecretAccessKey: String? = nil,
        region: String? = nil,
        s3BucketName: String? = nil,
        s3PathPrefix: String? = nil,
        fallbackIndex: Double? = nil,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.awsAccessKeyId = awsAccessKeyId
        self.awsSecretAccessKey = awsSecretAccessKey
        self.region = region
        self.s3BucketName = s3BucketName
        self.s3PathPrefix = s3PathPrefix
        self.fallbackIndex = fallbackIndex
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.awsAccessKeyId = try container.decodeIfPresent(String.self, forKey: .awsAccessKeyId)
        self.awsSecretAccessKey = try container.decodeIfPresent(String.self, forKey: .awsSecretAccessKey)
        self.region = try container.decodeIfPresent(String.self, forKey: .region)
        self.s3BucketName = try container.decodeIfPresent(String.self, forKey: .s3BucketName)
        self.s3PathPrefix = try container.decodeIfPresent(String.self, forKey: .s3PathPrefix)
        self.fallbackIndex = try container.decodeIfPresent(Double.self, forKey: .fallbackIndex)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.awsAccessKeyId, forKey: .awsAccessKeyId)
        try container.encodeIfPresent(self.awsSecretAccessKey, forKey: .awsSecretAccessKey)
        try container.encodeIfPresent(self.region, forKey: .region)
        try container.encodeIfPresent(self.s3BucketName, forKey: .s3BucketName)
        try container.encodeIfPresent(self.s3PathPrefix, forKey: .s3PathPrefix)
        try container.encodeIfPresent(self.fallbackIndex, forKey: .fallbackIndex)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case awsAccessKeyId
        case awsSecretAccessKey
        case region
        case s3BucketName
        case s3PathPrefix
        case fallbackIndex
        case name
    }
}