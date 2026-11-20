import Foundation

public struct CreateS3CompatibleCredentialDto: Codable, Hashable, Sendable {
    public let bucketPlan: S3CompatibleBucketPlan
    /// This is the order in which this storage provider is tried during upload retries. Lower numbers are tried first in increasing order.
    public let fallbackIndex: Double?
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bucketPlan: S3CompatibleBucketPlan,
        fallbackIndex: Double? = nil,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bucketPlan = bucketPlan
        self.fallbackIndex = fallbackIndex
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bucketPlan = try container.decode(S3CompatibleBucketPlan.self, forKey: .bucketPlan)
        self.fallbackIndex = try container.decodeIfPresent(Double.self, forKey: .fallbackIndex)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.bucketPlan, forKey: .bucketPlan)
        try container.encodeIfPresent(self.fallbackIndex, forKey: .fallbackIndex)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bucketPlan
        case fallbackIndex
        case name
    }
}