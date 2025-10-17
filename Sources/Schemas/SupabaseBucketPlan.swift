import Foundation

public struct SupabaseBucketPlan: Codable, Hashable, Sendable {
    /// This is the S3 Region. It should look like us-east-1
    /// It should be one of the supabase regions defined in the SUPABASE_REGION enum
    /// Check https://supabase.com/docs/guides/platform/regions for up to date regions
    public let region: SupabaseBucketPlanRegion
    /// This is the S3 compatible URL for Supabase S3
    /// This should look like https://<project-ID>.supabase.co/storage/v1/s3
    public let url: String
    /// This is the Supabase S3 Access Key ID.
    /// The user creates this in the Supabase project Storage settings
    public let accessKeyId: String
    /// This is the Supabase S3 Secret Access Key.
    /// The user creates this in the Supabase project Storage settings along with the access key id
    public let secretAccessKey: String
    /// This is the Supabase S3 Bucket Name.
    /// The user must create this in Supabase under Storage > Buckets
    /// A bucket that does not exist will not be checked now, but file uploads will fail
    public let name: String
    /// This is the Supabase S3 Bucket Folder Path.
    /// The user can create this in Supabase under Storage > Buckets
    /// A path that does not exist will not be checked now, but file uploads will fail
    /// A Path is like a folder in the bucket
    /// Eg. If the bucket is called "my-bucket" and the path is "my-folder", the full path is "my-bucket/my-folder"
    public let path: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        region: SupabaseBucketPlanRegion,
        url: String,
        accessKeyId: String,
        secretAccessKey: String,
        name: String,
        path: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.region = region
        self.url = url
        self.accessKeyId = accessKeyId
        self.secretAccessKey = secretAccessKey
        self.name = name
        self.path = path
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.region = try container.decode(SupabaseBucketPlanRegion.self, forKey: .region)
        self.url = try container.decode(String.self, forKey: .url)
        self.accessKeyId = try container.decode(String.self, forKey: .accessKeyId)
        self.secretAccessKey = try container.decode(String.self, forKey: .secretAccessKey)
        self.name = try container.decode(String.self, forKey: .name)
        self.path = try container.decodeIfPresent(String.self, forKey: .path)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.region, forKey: .region)
        try container.encode(self.url, forKey: .url)
        try container.encode(self.accessKeyId, forKey: .accessKeyId)
        try container.encode(self.secretAccessKey, forKey: .secretAccessKey)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.path, forKey: .path)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case region
        case url
        case accessKeyId
        case secretAccessKey
        case name
        case path
    }
}