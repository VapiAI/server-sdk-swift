import Foundation

public struct CreateGoHighLevelMcpCredentialDto: Codable, Hashable, Sendable {
    /// This is the authentication session for the credential.
    public let authenticationSession: Oauth2AuthenticationSession
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        authenticationSession: Oauth2AuthenticationSession,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.authenticationSession = authenticationSession
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.authenticationSession = try container.decode(Oauth2AuthenticationSession.self, forKey: .authenticationSession)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.authenticationSession, forKey: .authenticationSession)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case authenticationSession
        case name
    }
}