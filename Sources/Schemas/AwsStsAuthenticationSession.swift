import Foundation

public struct AwsStsAuthenticationSession: Codable, Hashable, Sendable {
    /// This is the assumed role user
    public let assumedRoleUser: AwsStsAssumeRoleUser?
    /// This is the credentials for the AWS STS assume role
    public let credentials: AwsStsCredentials?
    /// This is the size of the policy
    public let packedPolicySize: Double?
    /// This is the sourced ID entity
    public let sourcedIdEntity: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        assumedRoleUser: AwsStsAssumeRoleUser? = nil,
        credentials: AwsStsCredentials? = nil,
        packedPolicySize: Double? = nil,
        sourcedIdEntity: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.assumedRoleUser = assumedRoleUser
        self.credentials = credentials
        self.packedPolicySize = packedPolicySize
        self.sourcedIdEntity = sourcedIdEntity
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assumedRoleUser = try container.decodeIfPresent(AwsStsAssumeRoleUser.self, forKey: .assumedRoleUser)
        self.credentials = try container.decodeIfPresent(AwsStsCredentials.self, forKey: .credentials)
        self.packedPolicySize = try container.decodeIfPresent(Double.self, forKey: .packedPolicySize)
        self.sourcedIdEntity = try container.decodeIfPresent(String.self, forKey: .sourcedIdEntity)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.assumedRoleUser, forKey: .assumedRoleUser)
        try container.encodeIfPresent(self.credentials, forKey: .credentials)
        try container.encodeIfPresent(self.packedPolicySize, forKey: .packedPolicySize)
        try container.encodeIfPresent(self.sourcedIdEntity, forKey: .sourcedIdEntity)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case assumedRoleUser
        case credentials
        case packedPolicySize
        case sourcedIdEntity = "sourcedIDEntity"
    }
}