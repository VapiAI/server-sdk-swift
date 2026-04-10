import Foundation

public struct CreateAnthropicBedrockCredentialDto: Codable, Hashable, Sendable {
    /// AWS region where Bedrock is configured.
    public let region: CreateAnthropicBedrockCredentialDtoRegion
    /// Authentication method - either direct IAM credentials or cross-account role assumption.
    public let authenticationPlan: CreateAnthropicBedrockCredentialDtoAuthenticationPlan
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        region: CreateAnthropicBedrockCredentialDtoRegion,
        authenticationPlan: CreateAnthropicBedrockCredentialDtoAuthenticationPlan,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.region = region
        self.authenticationPlan = authenticationPlan
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.region = try container.decode(CreateAnthropicBedrockCredentialDtoRegion.self, forKey: .region)
        self.authenticationPlan = try container.decode(CreateAnthropicBedrockCredentialDtoAuthenticationPlan.self, forKey: .authenticationPlan)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.region, forKey: .region)
        try container.encode(self.authenticationPlan, forKey: .authenticationPlan)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case region
        case authenticationPlan
        case name
    }
}