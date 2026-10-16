import Foundation

public struct UpdateWebhookCredentialDto: Codable, Hashable, Sendable {
    public let provider: UpdateWebhookCredentialDtoProvider?
    /// This is the authentication plan. Supports OAuth2 RFC 6749, HMAC signing, and Bearer authentication.
    public let authenticationPlan: UpdateWebhookCredentialDtoAuthenticationPlan?
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: UpdateWebhookCredentialDtoProvider? = nil,
        authenticationPlan: UpdateWebhookCredentialDtoAuthenticationPlan? = nil,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.authenticationPlan = authenticationPlan
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decodeIfPresent(UpdateWebhookCredentialDtoProvider.self, forKey: .provider)
        self.authenticationPlan = try container.decodeIfPresent(UpdateWebhookCredentialDtoAuthenticationPlan.self, forKey: .authenticationPlan)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.authenticationPlan, forKey: .authenticationPlan)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case authenticationPlan
        case name
    }
}