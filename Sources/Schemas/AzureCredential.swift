import Foundation

public struct AzureCredential: Codable, Hashable, Sendable {
    public let provider: Azure
    /// This is the service being used in Azure.
    public let service: AzureCredentialService
    /// This is the region of the Azure resource.
    public let region: AzureCredentialRegion?
    /// This is not returned in the API.
    public let apiKey: String?
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
    /// This is the bucket plan that can be provided to store call artifacts in Azure Blob Storage.
    public let bucketPlan: AzureBlobStorageBucketPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: Azure,
        service: AzureCredentialService,
        region: AzureCredentialRegion? = nil,
        apiKey: String? = nil,
        fallbackIndex: Double? = nil,
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        name: String? = nil,
        bucketPlan: AzureBlobStorageBucketPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.service = service
        self.region = region
        self.apiKey = apiKey
        self.fallbackIndex = fallbackIndex
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.bucketPlan = bucketPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decode(Azure.self, forKey: .provider)
        self.service = try container.decode(AzureCredentialService.self, forKey: .service)
        self.region = try container.decodeIfPresent(AzureCredentialRegion.self, forKey: .region)
        self.apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
        self.fallbackIndex = try container.decodeIfPresent(Double.self, forKey: .fallbackIndex)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.bucketPlan = try container.decodeIfPresent(AzureBlobStorageBucketPlan.self, forKey: .bucketPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.provider, forKey: .provider)
        try container.encode(self.service, forKey: .service)
        try container.encodeIfPresent(self.region, forKey: .region)
        try container.encodeIfPresent(self.apiKey, forKey: .apiKey)
        try container.encodeIfPresent(self.fallbackIndex, forKey: .fallbackIndex)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.bucketPlan, forKey: .bucketPlan)
    }

    public enum Azure: String, Codable, Hashable, CaseIterable, Sendable {
        case azure
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case service
        case region
        case apiKey
        case fallbackIndex
        case id
        case orgId
        case createdAt
        case updatedAt
        case name
        case bucketPlan
    }
}