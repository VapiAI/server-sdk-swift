import Foundation

public struct CreateCustomCredentialDto: Codable, Hashable, Sendable {
    /// This is the authentication plan. Supports OAuth2 RFC 6749, HMAC signing, and Bearer authentication.
    public let authenticationPlan: CreateCustomCredentialDtoAuthenticationPlan
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        authenticationPlan: CreateCustomCredentialDtoAuthenticationPlan,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.authenticationPlan = authenticationPlan
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.authenticationPlan = try container.decode(CreateCustomCredentialDtoAuthenticationPlan.self, forKey: .authenticationPlan)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.authenticationPlan, forKey: .authenticationPlan)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case authenticationPlan
        case name
    }
}