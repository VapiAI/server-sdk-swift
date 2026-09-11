import Foundation

public struct UpdateElevenLabsCredentialDto: Codable, Hashable, Sendable {
    public let provider: Value?
    /// This is not returned in the API.
    public let apiKey: String?
    /// ElevenLabs-only API environment for this key: the global endpoint or the EU data residency endpoint. In EU deployments, new credentials must explicitly use the EU data residency endpoint; existing credentials may omit this field on update to retain their saved endpoint. Outside EU deployments, Vapi detects an omitted endpoint automatically and null on update clears and re-detects the endpoint.
    public let apiUrl: Nullable<UpdateElevenLabsCredentialDtoApiUrl>?
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: Value? = nil,
        apiKey: String? = nil,
        apiUrl: Nullable<UpdateElevenLabsCredentialDtoApiUrl>? = nil,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.apiKey = apiKey
        self.apiUrl = apiUrl
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decodeIfPresent(Value.self, forKey: .provider)
        self.apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
        self.apiUrl = try container.decodeNullableIfPresent(UpdateElevenLabsCredentialDtoApiUrl.self, forKey: .apiUrl)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.apiKey, forKey: .apiKey)
        try container.encodeNullableIfPresent(self.apiUrl, forKey: .apiUrl)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    public enum Value: String, Codable, Hashable, CaseIterable, Sendable {
        case value = "11labs"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case apiKey
        case apiUrl
        case name
    }
}