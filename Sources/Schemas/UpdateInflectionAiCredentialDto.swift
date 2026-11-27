import Foundation

public struct UpdateInflectionAiCredentialDto: Codable, Hashable, Sendable {
    /// This is the api key for Pi in InflectionAI's console. Get it from here: https://developers.inflection.ai/keys, billing will need to be setup
    public let provider: UpdateInflectionAiCredentialDtoProvider?
    /// This is not returned in the API.
    public let apiKey: String?
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: UpdateInflectionAiCredentialDtoProvider? = nil,
        apiKey: String? = nil,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.apiKey = apiKey
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decodeIfPresent(UpdateInflectionAiCredentialDtoProvider.self, forKey: .provider)
        self.apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.apiKey, forKey: .apiKey)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case apiKey
        case name
    }
}