import Foundation

public struct UpdateLangfuseCredentialDto: Codable, Hashable, Sendable {
    public let provider: UpdateLangfuseCredentialDtoProvider?
    /// The public key for Langfuse project. Eg: pk-lf-...
    public let publicKey: String?
    /// The secret key for Langfuse project. Eg: sk-lf-... .This is not returned in the API.
    public let apiKey: String?
    /// The host URL for Langfuse project. Eg: https://cloud.langfuse.com
    public let apiUrl: String?
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: UpdateLangfuseCredentialDtoProvider? = nil,
        publicKey: String? = nil,
        apiKey: String? = nil,
        apiUrl: String? = nil,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.publicKey = publicKey
        self.apiKey = apiKey
        self.apiUrl = apiUrl
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decodeIfPresent(UpdateLangfuseCredentialDtoProvider.self, forKey: .provider)
        self.publicKey = try container.decodeIfPresent(String.self, forKey: .publicKey)
        self.apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
        self.apiUrl = try container.decodeIfPresent(String.self, forKey: .apiUrl)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.publicKey, forKey: .publicKey)
        try container.encodeIfPresent(self.apiKey, forKey: .apiKey)
        try container.encodeIfPresent(self.apiUrl, forKey: .apiUrl)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case publicKey
        case apiKey
        case apiUrl
        case name
    }
}