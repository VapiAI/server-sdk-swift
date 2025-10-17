import Foundation

public struct UpdateSupabaseCredentialDto: Codable, Hashable, Sendable {
    /// This is the order in which this storage provider is tried during upload retries. Lower numbers are tried first in increasing order.
    public let fallbackIndex: Double?
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    public let bucketPlan: SupabaseBucketPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fallbackIndex: Double? = nil,
        name: String? = nil,
        bucketPlan: SupabaseBucketPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.fallbackIndex = fallbackIndex
        self.name = name
        self.bucketPlan = bucketPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fallbackIndex = try container.decodeIfPresent(Double.self, forKey: .fallbackIndex)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.bucketPlan = try container.decodeIfPresent(SupabaseBucketPlan.self, forKey: .bucketPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.fallbackIndex, forKey: .fallbackIndex)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.bucketPlan, forKey: .bucketPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case fallbackIndex
        case name
        case bucketPlan
    }
}