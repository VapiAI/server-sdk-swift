import Foundation

public struct AwsiamCredentialsAuthenticationPlan: Codable, Hashable, Sendable {
    /// AWS Access Key ID. This is not returned in the API.
    public let awsAccessKeyId: String
    /// AWS Secret Access Key. This is not returned in the API.
    public let awsSecretAccessKey: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        awsAccessKeyId: String,
        awsSecretAccessKey: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.awsAccessKeyId = awsAccessKeyId
        self.awsSecretAccessKey = awsSecretAccessKey
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.awsAccessKeyId = try container.decode(String.self, forKey: .awsAccessKeyId)
        self.awsSecretAccessKey = try container.decode(String.self, forKey: .awsSecretAccessKey)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.awsAccessKeyId, forKey: .awsAccessKeyId)
        try container.encode(self.awsSecretAccessKey, forKey: .awsSecretAccessKey)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case awsAccessKeyId
        case awsSecretAccessKey
    }
}