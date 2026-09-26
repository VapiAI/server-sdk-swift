import Foundation

public struct UpdateGoHighLevelMcpCredentialDto: Codable, Hashable, Sendable {
    public let provider: UpdateGoHighLevelMcpCredentialDtoProvider?
    /// This is the authentication session for the credential.
    public let authenticationSession: Oauth2AuthenticationSession?
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: UpdateGoHighLevelMcpCredentialDtoProvider? = nil,
        authenticationSession: Oauth2AuthenticationSession? = nil,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.authenticationSession = authenticationSession
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decodeIfPresent(UpdateGoHighLevelMcpCredentialDtoProvider.self, forKey: .provider)
        self.authenticationSession = try container.decodeIfPresent(Oauth2AuthenticationSession.self, forKey: .authenticationSession)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.authenticationSession, forKey: .authenticationSession)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case authenticationSession
        case name
    }
}