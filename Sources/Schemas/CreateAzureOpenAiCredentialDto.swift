import Foundation

public struct CreateAzureOpenAiCredentialDto: Codable, Hashable, Sendable {
    public let region: CreateAzureOpenAiCredentialDtoRegion
    public let models: [CreateAzureOpenAiCredentialDtoModelsItem]
    /// This is not returned in the API.
    public let openAiKey: String
    /// This is not returned in the API.
    public let ocpApimSubscriptionKey: String?
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
        openAiEndpoint: String,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.region = region
        self.models = models
        self.openAiKey = openAiKey
        self.ocpApimSubscriptionKey = ocpApimSubscriptionKey
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
        try container.encode(self.openAiEndpoint, forKey: .openAiEndpoint)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case region
        case models
        case openAiKey = "openAIKey"
        case ocpApimSubscriptionKey
        case openAiEndpoint = "openAIEndpoint"
        case name
    }
}