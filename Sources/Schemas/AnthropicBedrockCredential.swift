import Foundation

public struct AnthropicBedrockCredential: Codable, Hashable, Sendable {
    public let provider: AnthropicBedrockCredentialProvider
    /// AWS region where Bedrock is configured.
    public let region: AnthropicBedrockCredentialRegion
    /// Authentication method - either direct IAM credentials or cross-account role assumption.
    public let authenticationPlan: AnthropicBedrockCredentialAuthenticationPlan
    /// This is the unique identifier for the credential.
    public let id: String
    /// This is the unique identifier for the org that this credential belongs to.
    public let orgId: String
    /// This is the ISO 8601 date-time string of when the credential was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the assistant was last updated.
    public let updatedAt: Date
    /// Stores the external ID (generated or user-provided) for future AssumeRole calls.
    public let authenticationArtifact: AwsStsAuthenticationArtifact?
    /// Cached authentication session from AssumeRole (temporary credentials).
    /// Managed by the system, auto-refreshed when expired.
    public let authenticationSession: AwsStsAuthenticationSession?
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: AnthropicBedrockCredentialProvider,
        region: AnthropicBedrockCredentialRegion,
        authenticationPlan: AnthropicBedrockCredentialAuthenticationPlan,
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        authenticationArtifact: AwsStsAuthenticationArtifact? = nil,
        authenticationSession: AwsStsAuthenticationSession? = nil,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.region = region
        self.authenticationPlan = authenticationPlan
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.authenticationArtifact = authenticationArtifact
        self.authenticationSession = authenticationSession
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decode(AnthropicBedrockCredentialProvider.self, forKey: .provider)
        self.region = try container.decode(AnthropicBedrockCredentialRegion.self, forKey: .region)
        self.authenticationPlan = try container.decode(AnthropicBedrockCredentialAuthenticationPlan.self, forKey: .authenticationPlan)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.authenticationArtifact = try container.decodeIfPresent(AwsStsAuthenticationArtifact.self, forKey: .authenticationArtifact)
        self.authenticationSession = try container.decodeIfPresent(AwsStsAuthenticationSession.self, forKey: .authenticationSession)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.provider, forKey: .provider)
        try container.encode(self.region, forKey: .region)
        try container.encode(self.authenticationPlan, forKey: .authenticationPlan)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(self.authenticationArtifact, forKey: .authenticationArtifact)
        try container.encodeIfPresent(self.authenticationSession, forKey: .authenticationSession)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case region
        case authenticationPlan
        case id
        case orgId
        case createdAt
        case updatedAt
        case authenticationArtifact
        case authenticationSession
        case name
    }
}