import Foundation

public struct CreateMicrosoftCredentialDto: Codable, Hashable, Sendable {
    /// This is not returned in the API.
    public let apiKey: String
    /// Azure region for the Speech resource. Defaults to `eastus` when omitted. MAI-Voice-2 is preview and region-limited.
    public let region: String?
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        apiKey: String,
        region: String? = nil,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.apiKey = apiKey
        self.region = region
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.apiKey = try container.decode(String.self, forKey: .apiKey)
        self.region = try container.decodeIfPresent(String.self, forKey: .region)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.apiKey, forKey: .apiKey)
        try container.encodeIfPresent(self.region, forKey: .region)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case apiKey
        case region
        case name
    }
}