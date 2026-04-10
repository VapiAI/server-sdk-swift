import Foundation

public struct AwsStsAuthenticationPlan: Codable, Hashable, Sendable {
    /// This is the role ARN for the AWS credential
    public let roleArn: String
    /// Optional external ID for additional security in the role trust policy.
    public let externalId: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        roleArn: String,
        externalId: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.roleArn = roleArn
        self.externalId = externalId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.roleArn = try container.decode(String.self, forKey: .roleArn)
        self.externalId = try container.decodeIfPresent(String.self, forKey: .externalId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.roleArn, forKey: .roleArn)
        try container.encodeIfPresent(self.externalId, forKey: .externalId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case roleArn
        case externalId
    }
}