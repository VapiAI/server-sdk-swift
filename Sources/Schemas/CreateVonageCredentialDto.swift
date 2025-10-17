import Foundation

public struct CreateVonageCredentialDto: Codable, Hashable, Sendable {
    /// This is not returned in the API.
    public let apiSecret: String
    public let apiKey: String
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        apiSecret: String,
        apiKey: String,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.apiSecret = apiSecret
        self.apiKey = apiKey
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.apiSecret = try container.decode(String.self, forKey: .apiSecret)
        self.apiKey = try container.decode(String.self, forKey: .apiKey)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.apiSecret, forKey: .apiSecret)
        try container.encode(self.apiKey, forKey: .apiKey)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case apiSecret
        case apiKey
        case name
    }
}