import Foundation

public struct UpdateMakeCredentialDto: Codable, Hashable, Sendable {
    /// Team ID
    public let teamId: String?
    /// Region of your application. For example: eu1, eu2, us1, us2
    public let region: String?
    /// This is not returned in the API.
    public let apiKey: String?
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        teamId: String? = nil,
        region: String? = nil,
        apiKey: String? = nil,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.teamId = teamId
        self.region = region
        self.apiKey = apiKey
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.teamId = try container.decodeIfPresent(String.self, forKey: .teamId)
        self.region = try container.decodeIfPresent(String.self, forKey: .region)
        self.apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.teamId, forKey: .teamId)
        try container.encodeIfPresent(self.region, forKey: .region)
        try container.encodeIfPresent(self.apiKey, forKey: .apiKey)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case teamId
        case region
        case apiKey
        case name
    }
}