import Foundation

public struct Oauth2AuthenticationSession: Codable, Hashable, Sendable {
    /// This is the OAuth2 access token.
    public let accessToken: String?
    /// This is the OAuth2 access token expiration.
    public let expiresAt: Date?
    /// This is the OAuth2 refresh token.
    public let refreshToken: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accessToken: String? = nil,
        expiresAt: Date? = nil,
        refreshToken: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accessToken = accessToken
        self.expiresAt = expiresAt
        self.refreshToken = refreshToken
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accessToken = try container.decodeIfPresent(String.self, forKey: .accessToken)
        self.expiresAt = try container.decodeIfPresent(Date.self, forKey: .expiresAt)
        self.refreshToken = try container.decodeIfPresent(String.self, forKey: .refreshToken)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.accessToken, forKey: .accessToken)
        try container.encodeIfPresent(self.expiresAt, forKey: .expiresAt)
        try container.encodeIfPresent(self.refreshToken, forKey: .refreshToken)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accessToken
        case expiresAt
        case refreshToken
    }
}