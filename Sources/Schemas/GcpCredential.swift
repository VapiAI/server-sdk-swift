import Foundation

public struct GcpCredential: Codable, Hashable, Sendable {
    public let provider: Gcp
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
    /// This is the GCP key. This is the JSON that can be generated in the Google Cloud Console at https://console.cloud.google.com/iam-admin/serviceaccounts/details/<service-account-id>/keys.
    /// 
    /// The schema is identical to the JSON that GCP outputs.
    public let gcpKey: GcpKey
    /// This is the region of the GCP resource.
    public let region: String?
    public let bucketPlan: BucketPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: Gcp,
        fallbackIndex: Double? = nil,
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        name: String? = nil,
        gcpKey: GcpKey,
        region: String? = nil,
        bucketPlan: BucketPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.fallbackIndex = fallbackIndex
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.gcpKey = gcpKey
        self.region = region
        self.bucketPlan = bucketPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decode(Gcp.self, forKey: .provider)
        self.fallbackIndex = try container.decodeIfPresent(Double.self, forKey: .fallbackIndex)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.gcpKey = try container.decode(GcpKey.self, forKey: .gcpKey)
        self.region = try container.decodeIfPresent(String.self, forKey: .region)
        self.bucketPlan = try container.decodeIfPresent(BucketPlan.self, forKey: .bucketPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.fallbackIndex, forKey: .fallbackIndex)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(self.gcpKey, forKey: .gcpKey)
        try container.encodeIfPresent(self.region, forKey: .region)
        try container.encodeIfPresent(self.bucketPlan, forKey: .bucketPlan)
    }

    public enum Gcp: String, Codable, Hashable, CaseIterable, Sendable {
        case gcp
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case fallbackIndex
        case id
        case orgId
        case createdAt
        case updatedAt
        case name
        case gcpKey
        case region
        case bucketPlan
    }
}