import Foundation

public struct AwsStsAssumeRoleUser: Codable, Hashable, Sendable {
    /// This is the assumed role ID
    public let assumedRoleId: String?
    /// This is the assumed role ARN
    public let arn: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        assumedRoleId: String? = nil,
        arn: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.assumedRoleId = assumedRoleId
        self.arn = arn
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assumedRoleId = try container.decodeIfPresent(String.self, forKey: .assumedRoleId)
        self.arn = try container.decodeIfPresent(String.self, forKey: .arn)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.assumedRoleId, forKey: .assumedRoleId)
        try container.encodeIfPresent(self.arn, forKey: .arn)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case assumedRoleId = "AssumedRoleId"
        case arn = "Arn"
    }
}