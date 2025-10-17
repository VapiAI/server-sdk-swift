import Foundation

public struct BucketPlan: Codable, Hashable, Sendable {
    /// This is the name of the bucket.
    public let name: String
    /// This is the region of the bucket.
    /// 
    /// Usage:
    /// - If `credential.type` is `aws`, then this is required.
    /// - If `credential.type` is `gcp`, then this is optional since GCP allows buckets to be accessed without a region but region is required for data residency requirements. Read here: https://cloud.google.com/storage/docs/request-endpoints
    /// 
    /// This overrides the `credential.region` field if it is provided.
    public let region: String?
    /// This is the path where call artifacts will be stored.
    /// 
    /// Usage:
    /// - To store call artifacts in a specific folder, set this to the full path. Eg. "/folder-name1/folder-name2".
    /// - To store call artifacts in the root of the bucket, leave this blank.
    /// 
    /// @default "/"
    public let path: String?
    /// This is the HMAC access key offered by GCP for interoperability with S3 clients. Here is the guide on how to create: https://cloud.google.com/storage/docs/authentication/managing-hmackeys#console
    /// 
    /// Usage:
    /// - If `credential.type` is `gcp`, then this is required.
    /// - If `credential.type` is `aws`, then this is not required since credential.awsAccessKeyId is used instead.
    public let hmacAccessKey: String?
    /// This is the secret for the HMAC access key. Here is the guide on how to create: https://cloud.google.com/storage/docs/authentication/managing-hmackeys#console
    /// 
    /// Usage:
    /// - If `credential.type` is `gcp`, then this is required.
    /// - If `credential.type` is `aws`, then this is not required since credential.awsSecretAccessKey is used instead.
    /// 
    /// Note: This is not returned in the API.
    public let hmacSecret: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        region: String? = nil,
        path: String? = nil,
        hmacAccessKey: String? = nil,
        hmacSecret: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.region = region
        self.path = path
        self.hmacAccessKey = hmacAccessKey
        self.hmacSecret = hmacSecret
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.region = try container.decodeIfPresent(String.self, forKey: .region)
        self.path = try container.decodeIfPresent(String.self, forKey: .path)
        self.hmacAccessKey = try container.decodeIfPresent(String.self, forKey: .hmacAccessKey)
        self.hmacSecret = try container.decodeIfPresent(String.self, forKey: .hmacSecret)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.region, forKey: .region)
        try container.encodeIfPresent(self.path, forKey: .path)
        try container.encodeIfPresent(self.hmacAccessKey, forKey: .hmacAccessKey)
        try container.encodeIfPresent(self.hmacSecret, forKey: .hmacSecret)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case region
        case path
        case hmacAccessKey
        case hmacSecret
    }
}