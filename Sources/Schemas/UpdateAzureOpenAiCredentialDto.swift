import Foundation

public struct UpdateAzureOpenAiCredentialDto: Codable, Hashable, Sendable {
    public let region: UpdateAzureOpenAiCredentialDtoRegion?
    public let models: [UpdateAzureOpenAiCredentialDtoModelsItem]?
    /// This is not returned in the API.
    public let openAiKey: String?
    /// This is not returned in the API.
    public let ocpApimSubscriptionKey: String?
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    public let openAiEndpoint: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        region: UpdateAzureOpenAiCredentialDtoRegion? = nil,
        models: [UpdateAzureOpenAiCredentialDtoModelsItem]? = nil,
        openAiKey: String? = nil,
        ocpApimSubscriptionKey: String? = nil,
        name: String? = nil,
        openAiEndpoint: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.region = region
        self.models = models
        self.openAiKey = openAiKey
        self.ocpApimSubscriptionKey = ocpApimSubscriptionKey
        self.name = name
        self.openAiEndpoint = openAiEndpoint
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.region = try container.decodeIfPresent(UpdateAzureOpenAiCredentialDtoRegion.self, forKey: .region)
        self.models = try container.decodeIfPresent([UpdateAzureOpenAiCredentialDtoModelsItem].self, forKey: .models)
        self.openAiKey = try container.decodeIfPresent(String.self, forKey: .openAiKey)
        self.ocpApimSubscriptionKey = try container.decodeIfPresent(String.self, forKey: .ocpApimSubscriptionKey)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.openAiEndpoint = try container.decodeIfPresent(String.self, forKey: .openAiEndpoint)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.region, forKey: .region)
        try container.encodeIfPresent(self.models, forKey: .models)
        try container.encodeIfPresent(self.openAiKey, forKey: .openAiKey)
        try container.encodeIfPresent(self.ocpApimSubscriptionKey, forKey: .ocpApimSubscriptionKey)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.openAiEndpoint, forKey: .openAiEndpoint)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case region
        case models
        case openAiKey = "openAIKey"
        case ocpApimSubscriptionKey
        case name
        case openAiEndpoint = "openAIEndpoint"
    }
}