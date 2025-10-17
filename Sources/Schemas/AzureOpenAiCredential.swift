import Foundation

public struct AzureOpenAiCredential: Codable, Hashable, Sendable {
    public let provider: AzureOpenai
    public let region: AzureOpenAiCredentialRegion
    public let models: [AzureOpenAiCredentialModelsItem]
    /// This is not returned in the API.
    public let openAiKey: String
    /// This is not returned in the API.
    public let ocpApimSubscriptionKey: String?
    /// This is the unique identifier for the credential.
    public let id: String
    /// This is the unique identifier for the org that this credential belongs to.
    public let orgId: String
    /// This is the ISO 8601 date-time string of when the credential was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the assistant was last updated.
    public let updatedAt: Date
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    public let openAiEndpoint: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: AzureOpenai,
        region: AzureOpenAiCredentialRegion,
        models: [AzureOpenAiCredentialModelsItem],
        openAiKey: String,
        ocpApimSubscriptionKey: String? = nil,
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        name: String? = nil,
        openAiEndpoint: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.region = region
        self.models = models
        self.openAiKey = openAiKey
        self.ocpApimSubscriptionKey = ocpApimSubscriptionKey
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.openAiEndpoint = openAiEndpoint
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decode(AzureOpenai.self, forKey: .provider)
        self.region = try container.decode(AzureOpenAiCredentialRegion.self, forKey: .region)
        self.models = try container.decode([AzureOpenAiCredentialModelsItem].self, forKey: .models)
        self.openAiKey = try container.decode(String.self, forKey: .openAiKey)
        self.ocpApimSubscriptionKey = try container.decodeIfPresent(String.self, forKey: .ocpApimSubscriptionKey)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.openAiEndpoint = try container.decode(String.self, forKey: .openAiEndpoint)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.provider, forKey: .provider)
        try container.encode(self.region, forKey: .region)
        try container.encode(self.models, forKey: .models)
        try container.encode(self.openAiKey, forKey: .openAiKey)
        try container.encodeIfPresent(self.ocpApimSubscriptionKey, forKey: .ocpApimSubscriptionKey)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(self.openAiEndpoint, forKey: .openAiEndpoint)
    }

    public enum AzureOpenai: String, Codable, Hashable, CaseIterable, Sendable {
        case azureOpenai = "azure-openai"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case region
        case models
        case openAiKey = "openAIKey"
        case ocpApimSubscriptionKey
        case id
        case orgId
        case createdAt
        case updatedAt
        case name
        case openAiEndpoint = "openAIEndpoint"
    }
}