import Foundation

public struct CreateLangfuseCredentialDto: Codable, Hashable, Sendable {
    /// The public key for Langfuse project. Eg: pk-lf-...
    public let publicKey: String
    /// The secret key for Langfuse project. Eg: sk-lf-... .This is not returned in the API.
    public let apiKey: String
    /// The host URL for Langfuse project. Eg: https://cloud.langfuse.com
    public let apiUrl: String
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        publicKey: String,
        apiKey: String,
        apiUrl: String,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.publicKey = publicKey
        self.apiKey = apiKey
        self.apiUrl = apiUrl
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.publicKey = try container.decode(String.self, forKey: .publicKey)
        self.apiKey = try container.decode(String.self, forKey: .apiKey)
        self.apiUrl = try container.decode(String.self, forKey: .apiUrl)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.publicKey, forKey: .publicKey)
        try container.encode(self.apiKey, forKey: .apiKey)
        try container.encode(self.apiUrl, forKey: .apiUrl)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case publicKey
        case apiKey
        case apiUrl
        case name
    }
}