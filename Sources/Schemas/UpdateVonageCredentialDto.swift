import Foundation

public struct UpdateVonageCredentialDto: Codable, Hashable, Sendable {
    /// This is not returned in the API.
    public let apiSecret: String?
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    public let apiKey: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        apiSecret: String? = nil,
        name: String? = nil,
        apiKey: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.apiSecret = apiSecret
        self.name = name
        self.apiKey = apiKey
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.apiSecret = try container.decodeIfPresent(String.self, forKey: .apiSecret)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.apiSecret, forKey: .apiSecret)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.apiKey, forKey: .apiKey)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case apiSecret
        case name
        case apiKey
    }
}