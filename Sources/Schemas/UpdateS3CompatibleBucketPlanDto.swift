import Foundation

public struct UpdateS3CompatibleBucketPlanDto: Codable, Hashable, Sendable {
    /// S3-compatible endpoint URL, such as https://s3.us-west-004.backblazeb2.com. Must be public HTTPS.
    public let url: String?
    /// SigV4 signing region expected by the object store. Most stores accept us-east-1.
    public let region: String?
    /// S3 access key ID.
    public let accessKeyId: String?
    /// S3 secret access key. This is not returned in the API.
    public let secretAccessKey: String?
    /// Bucket name.
    public let name: String?
    /// Optional key prefix inside the bucket, such as recordings/.
    public let path: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        url: String? = nil,
        region: String? = nil,
        accessKeyId: String? = nil,
        secretAccessKey: String? = nil,
        name: String? = nil,
        path: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.url = url
        self.region = region
        self.accessKeyId = accessKeyId
        self.secretAccessKey = secretAccessKey
        self.name = name
        self.path = path
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.region = try container.decodeIfPresent(String.self, forKey: .region)
        self.accessKeyId = try container.decodeIfPresent(String.self, forKey: .accessKeyId)
        self.secretAccessKey = try container.decodeIfPresent(String.self, forKey: .secretAccessKey)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.path = try container.decodeIfPresent(String.self, forKey: .path)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encodeIfPresent(self.region, forKey: .region)
        try container.encodeIfPresent(self.accessKeyId, forKey: .accessKeyId)
        try container.encodeIfPresent(self.secretAccessKey, forKey: .secretAccessKey)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.path, forKey: .path)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case url
        case region
        case accessKeyId
        case secretAccessKey
        case name
        case path
    }
}