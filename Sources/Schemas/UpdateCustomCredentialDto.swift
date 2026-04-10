import Foundation

public struct UpdateCustomCredentialDto: Codable, Hashable, Sendable {
    /// This is the authentication plan. Supports OAuth2 RFC 6749, HMAC signing, and Bearer authentication.
    public let authenticationPlan: UpdateCustomCredentialDtoAuthenticationPlan?
    /// This is the encryption plan for encrypting sensitive data. Currently supports public-key encryption.
    public let encryptionPlan: UpdateCustomCredentialDtoEncryptionPlan?
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        authenticationPlan: UpdateCustomCredentialDtoAuthenticationPlan? = nil,
        encryptionPlan: UpdateCustomCredentialDtoEncryptionPlan? = nil,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.authenticationPlan = authenticationPlan
        self.encryptionPlan = encryptionPlan
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.authenticationPlan = try container.decodeIfPresent(UpdateCustomCredentialDtoAuthenticationPlan.self, forKey: .authenticationPlan)
        self.encryptionPlan = try container.decodeIfPresent(UpdateCustomCredentialDtoEncryptionPlan.self, forKey: .encryptionPlan)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.authenticationPlan, forKey: .authenticationPlan)
        try container.encodeIfPresent(self.encryptionPlan, forKey: .encryptionPlan)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case authenticationPlan
        case encryptionPlan
        case name
    }
}