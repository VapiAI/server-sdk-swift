import Foundation

public struct UpdateS3CompatibleCredentialDto: Codable, Hashable, Sendable {
    /// This is for S3-compatible storage such as MinIO, Garage, Ceph, or Backblaze B2.
    public let provider: UpdateS3CompatibleCredentialDtoProvider?
    /// This is the order in which this storage provider is tried during upload retries. Lower numbers are tried first in increasing order.
    public let fallbackIndex: Double?
    public let bucketPlan: UpdateS3CompatibleBucketPlanDto?
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: UpdateS3CompatibleCredentialDtoProvider? = nil,
        fallbackIndex: Double? = nil,
        bucketPlan: UpdateS3CompatibleBucketPlanDto? = nil,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.fallbackIndex = fallbackIndex
        self.bucketPlan = bucketPlan
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decodeIfPresent(UpdateS3CompatibleCredentialDtoProvider.self, forKey: .provider)
        self.fallbackIndex = try container.decodeIfPresent(Double.self, forKey: .fallbackIndex)
        self.bucketPlan = try container.decodeIfPresent(UpdateS3CompatibleBucketPlanDto.self, forKey: .bucketPlan)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.fallbackIndex, forKey: .fallbackIndex)
        try container.encodeIfPresent(self.bucketPlan, forKey: .bucketPlan)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case fallbackIndex
        case bucketPlan
        case name
    }
}