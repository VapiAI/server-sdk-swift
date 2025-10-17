import Foundation

public struct CredentialSessionResponse: Codable, Hashable, Sendable {
    public let sessionToken: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        sessionToken: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.sessionToken = sessionToken
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.sessionToken = try container.decode(String.self, forKey: .sessionToken)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.sessionToken, forKey: .sessionToken)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case sessionToken
    }
}