import Foundation

public struct CloudflareR2BucketPlan: Codable, Hashable, Sendable {
    /// Cloudflare R2 Access key ID.
    public let accessKeyId: String?
    /// Cloudflare R2 access key secret. This is not returned in the API.
    public let secretAccessKey: String?
    /// Cloudflare R2 base url.
    public let url: String?
    /// This is the name of the bucket.
    public let name: String
    /// This is the path where call artifacts will be stored.
    /// 
    /// Usage:
    /// - To store call artifacts in a specific folder, set this to the full path. Eg. "/folder-name1/folder-name2".
    /// - To store call artifacts in the root of the bucket, leave this blank.
    /// 
    /// @default "/"
    public let path: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accessKeyId: String? = nil,
        secretAccessKey: String? = nil,
        url: String? = nil,
        name: String,
        path: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accessKeyId = accessKeyId
        self.secretAccessKey = secretAccessKey
        self.url = url
        self.name = name
        self.path = path
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accessKeyId = try container.decodeIfPresent(String.self, forKey: .accessKeyId)
        self.secretAccessKey = try container.decodeIfPresent(String.self, forKey: .secretAccessKey)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.name = try container.decode(String.self, forKey: .name)
        self.path = try container.decodeIfPresent(String.self, forKey: .path)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.accessKeyId, forKey: .accessKeyId)
        try container.encodeIfPresent(self.secretAccessKey, forKey: .secretAccessKey)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.path, forKey: .path)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accessKeyId
        case secretAccessKey
        case url
        case name
        case path
    }
}