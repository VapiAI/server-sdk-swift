import Foundation

public struct AwsStsAuthenticationArtifact: Codable, Hashable, Sendable {
    /// This is the optional external ID for the AWS credential
    public let externalId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        externalId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.externalId = externalId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.externalId = try container.decode(String.self, forKey: .externalId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.externalId, forKey: .externalId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case externalId
    }
}