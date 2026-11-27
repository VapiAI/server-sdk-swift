import Foundation

/// Credentials for authenticating assistant model requests with Azure OpenAI, including region, endpoint, and available models.
public struct CreateAzureOpenAiCredentialDto: Codable, Hashable, Sendable {
    /// Azure region that hosts the OpenAI resource.
    public let region: CreateAzureOpenAiCredentialDtoRegion
    /// Azure OpenAI models available through this credential.
    public let models: [CreateAzureOpenAiCredentialDtoModelsItem]
    /// This is not returned in the API.
    public let openAiKey: String
    /// This is not returned in the API.
    public let ocpApimSubscriptionKey: String?
    /// These are the names of your Azure deployments, one entry for every model in `models`. Omit the field when every deployment is named after its model; once it has any entry, a model with no entry is rejected, so a deployment named after its model takes `{ "model": "<model>", "name": "<model>" }`. Requests use the first of the org's keys that matches the region (on a live call, also the model), so an org holding two keys for the same region and model should pin `credentialIds` on its assistants.
    public let deployments: [AzureOpenAiDeployment]?
    /// Endpoint URL for the Azure OpenAI resource.
    public let openAiEndpoint: String
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        region: CreateAzureOpenAiCredentialDtoRegion,
        models: [CreateAzureOpenAiCredentialDtoModelsItem],
        openAiKey: String,
        ocpApimSubscriptionKey: String? = nil,
        deployments: [AzureOpenAiDeployment]? = nil,
        openAiEndpoint: String,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.region = region
        self.models = models
        self.openAiKey = openAiKey
        self.ocpApimSubscriptionKey = ocpApimSubscriptionKey
        self.deployments = deployments
        self.openAiEndpoint = openAiEndpoint
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.region = try container.decode(CreateAzureOpenAiCredentialDtoRegion.self, forKey: .region)
        self.models = try container.decode([CreateAzureOpenAiCredentialDtoModelsItem].self, forKey: .models)
        self.openAiKey = try container.decode(String.self, forKey: .openAiKey)
        self.ocpApimSubscriptionKey = try container.decodeIfPresent(String.self, forKey: .ocpApimSubscriptionKey)
        self.deployments = try container.decodeIfPresent([AzureOpenAiDeployment].self, forKey: .deployments)
        self.openAiEndpoint = try container.decode(String.self, forKey: .openAiEndpoint)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.region, forKey: .region)
        try container.encode(self.models, forKey: .models)
        try container.encode(self.openAiKey, forKey: .openAiKey)
        try container.encodeIfPresent(self.ocpApimSubscriptionKey, forKey: .ocpApimSubscriptionKey)
        try container.encodeIfPresent(self.deployments, forKey: .deployments)
        try container.encode(self.openAiEndpoint, forKey: .openAiEndpoint)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case region
        case models
        case openAiKey = "openAIKey"
        case ocpApimSubscriptionKey
        case deployments
        case openAiEndpoint = "openAIEndpoint"
        case name
    }
}