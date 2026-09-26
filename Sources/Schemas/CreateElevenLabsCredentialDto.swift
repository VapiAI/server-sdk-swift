import Foundation

/// Credentials for authenticating speech recognition and voice synthesis requests with ElevenLabs.
public struct CreateElevenLabsCredentialDto: Codable, Hashable, Sendable {
    /// This is not returned in the API.
    public let apiKey: String
    /// ElevenLabs-only API environment for this key: the global endpoint or the EU data residency endpoint. In EU deployments, new credentials must explicitly use the EU data residency endpoint; existing credentials may omit this field on update to retain their saved endpoint. Outside EU deployments, Vapi detects an omitted endpoint automatically and null on update clears and re-detects the endpoint.
    public let apiUrl: Nullable<CreateElevenLabsCredentialDtoApiUrl>?
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        apiKey: String,
        apiUrl: Nullable<CreateElevenLabsCredentialDtoApiUrl>? = nil,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.apiKey = apiKey
        self.apiUrl = apiUrl
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.apiKey = try container.decode(String.self, forKey: .apiKey)
        self.apiUrl = try container.decodeNullableIfPresent(CreateElevenLabsCredentialDtoApiUrl.self, forKey: .apiUrl)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.apiKey, forKey: .apiKey)
        try container.encodeNullableIfPresent(self.apiUrl, forKey: .apiUrl)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case apiKey
        case apiUrl
        case name
    }
}