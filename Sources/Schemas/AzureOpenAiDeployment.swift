import Foundation

public struct AzureOpenAiDeployment: Codable, Hashable, Sendable {
    /// This is the model the deployment serves. It must be one of the credential's `models`.
    public let model: AzureOpenAiDeploymentModel
    /// This is the name of the deployment in your Azure resource, exactly as Azure shows it.
    public let name: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        model: AzureOpenAiDeploymentModel,
        name: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.model = model
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.model = try container.decode(AzureOpenAiDeploymentModel.self, forKey: .model)
        self.name = try container.decode(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.model, forKey: .model)
        try container.encode(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case model
        case name
    }
}