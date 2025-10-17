import Foundation

public struct CreateGcpCredentialDto: Codable, Hashable, Sendable {
    /// This is the order in which this storage provider is tried during upload retries. Lower numbers are tried first in increasing order.
    public let fallbackIndex: Double?
    /// This is the GCP key. This is the JSON that can be generated in the Google Cloud Console at https://console.cloud.google.com/iam-admin/serviceaccounts/details/<service-account-id>/keys.
    /// 
    /// The schema is identical to the JSON that GCP outputs.
    public let gcpKey: GcpKey
    /// This is the region of the GCP resource.
    public let region: String?
    public let bucketPlan: BucketPlan?
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fallbackIndex: Double? = nil,
        gcpKey: GcpKey,
        region: String? = nil,
        bucketPlan: BucketPlan? = nil,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.fallbackIndex = fallbackIndex
        self.gcpKey = gcpKey
        self.region = region
        self.bucketPlan = bucketPlan
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fallbackIndex = try container.decodeIfPresent(Double.self, forKey: .fallbackIndex)
        self.gcpKey = try container.decode(GcpKey.self, forKey: .gcpKey)
        self.region = try container.decodeIfPresent(String.self, forKey: .region)
        self.bucketPlan = try container.decodeIfPresent(BucketPlan.self, forKey: .bucketPlan)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.fallbackIndex, forKey: .fallbackIndex)
        try container.encode(self.gcpKey, forKey: .gcpKey)
        try container.encodeIfPresent(self.region, forKey: .region)
        try container.encodeIfPresent(self.bucketPlan, forKey: .bucketPlan)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case fallbackIndex
        case gcpKey
        case region
        case bucketPlan
        case name
    }
}