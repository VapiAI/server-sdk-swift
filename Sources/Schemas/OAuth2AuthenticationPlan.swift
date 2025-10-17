import Foundation

public struct OAuth2AuthenticationPlan: Codable, Hashable, Sendable {
    /// This is the OAuth2 URL.
    public let url: String
    /// This is the OAuth2 client ID.
    public let clientId: String
    /// This is the OAuth2 client secret.
    public let clientSecret: String
    /// This is the scope of the OAuth2 token.
    public let scope: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        url: String,
        clientId: String,
        clientSecret: String,
        scope: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.url = url
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.scope = scope
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decode(String.self, forKey: .url)
        self.clientId = try container.decode(String.self, forKey: .clientId)
        self.clientSecret = try container.decode(String.self, forKey: .clientSecret)
        self.scope = try container.decodeIfPresent(String.self, forKey: .scope)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.url, forKey: .url)
        try container.encode(self.clientId, forKey: .clientId)
        try container.encode(self.clientSecret, forKey: .clientSecret)
        try container.encodeIfPresent(self.scope, forKey: .scope)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case url
        case clientId
        case clientSecret
        case scope
    }
}