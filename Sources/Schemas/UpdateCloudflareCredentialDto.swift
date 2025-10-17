import Foundation

public struct UpdateCloudflareCredentialDto: Codable, Hashable, Sendable {
    /// Cloudflare Account Id.
    public let accountId: String?
    /// Cloudflare API Key / Token.
    public let apiKey: String?
    /// Cloudflare Account Email.
    public let accountEmail: String?
    /// This is the order in which this storage provider is tried during upload retries. Lower numbers are tried first in increasing order.
    public let fallbackIndex: Double?
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// This is the bucket plan that can be provided to store call artifacts in R2
    public let bucketPlan: CloudflareR2BucketPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String? = nil,
        apiKey: String? = nil,
        accountEmail: String? = nil,
        fallbackIndex: Double? = nil,
        name: String? = nil,
        bucketPlan: CloudflareR2BucketPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.apiKey = apiKey
        self.accountEmail = accountEmail
        self.fallbackIndex = fallbackIndex
        self.name = name
        self.bucketPlan = bucketPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
        self.apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
        self.accountEmail = try container.decodeIfPresent(String.self, forKey: .accountEmail)
        self.fallbackIndex = try container.decodeIfPresent(Double.self, forKey: .fallbackIndex)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.bucketPlan = try container.decodeIfPresent(CloudflareR2BucketPlan.self, forKey: .bucketPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.accountId, forKey: .accountId)
        try container.encodeIfPresent(self.apiKey, forKey: .apiKey)
        try container.encodeIfPresent(self.accountEmail, forKey: .accountEmail)
        try container.encodeIfPresent(self.fallbackIndex, forKey: .fallbackIndex)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.bucketPlan, forKey: .bucketPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId
        case apiKey
        case accountEmail
        case fallbackIndex
        case name
        case bucketPlan
    }
}