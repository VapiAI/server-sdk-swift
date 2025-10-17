import Foundation

public struct CreateAzureCredentialDto: Codable, Hashable, Sendable {
    /// This is the service being used in Azure.
    public let service: CreateAzureCredentialDtoService
    /// This is the region of the Azure resource.
    public let region: CreateAzureCredentialDtoRegion?
    /// This is not returned in the API.
    public let apiKey: String?
    /// This is the order in which this storage provider is tried during upload retries. Lower numbers are tried first in increasing order.
    public let fallbackIndex: Double?
    /// This is the bucket plan that can be provided to store call artifacts in Azure Blob Storage.
    public let bucketPlan: AzureBlobStorageBucketPlan?
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        service: CreateAzureCredentialDtoService,
        region: CreateAzureCredentialDtoRegion? = nil,
        apiKey: String? = nil,
        fallbackIndex: Double? = nil,
        bucketPlan: AzureBlobStorageBucketPlan? = nil,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.service = service
        self.region = region
        self.apiKey = apiKey
        self.fallbackIndex = fallbackIndex
        self.bucketPlan = bucketPlan
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.service = try container.decode(CreateAzureCredentialDtoService.self, forKey: .service)
        self.region = try container.decodeIfPresent(CreateAzureCredentialDtoRegion.self, forKey: .region)
        self.apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
        self.fallbackIndex = try container.decodeIfPresent(Double.self, forKey: .fallbackIndex)
        self.bucketPlan = try container.decodeIfPresent(AzureBlobStorageBucketPlan.self, forKey: .bucketPlan)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.service, forKey: .service)
        try container.encodeIfPresent(self.region, forKey: .region)
        try container.encodeIfPresent(self.apiKey, forKey: .apiKey)
        try container.encodeIfPresent(self.fallbackIndex, forKey: .fallbackIndex)
        try container.encodeIfPresent(self.bucketPlan, forKey: .bucketPlan)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case service
        case region
        case apiKey
        case fallbackIndex
        case bucketPlan
        case name
    }
}