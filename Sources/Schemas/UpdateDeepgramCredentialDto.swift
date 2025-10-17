import Foundation

public struct UpdateDeepgramCredentialDto: Codable, Hashable, Sendable {
    /// This is not returned in the API.
    public let apiKey: String?
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// This can be used to point to an onprem Deepgram instance. Defaults to api.deepgram.com.
    public let apiUrl: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        apiKey: String? = nil,
        name: String? = nil,
        apiUrl: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.apiKey = apiKey
        self.name = name
        self.apiUrl = apiUrl
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.apiUrl = try container.decodeIfPresent(String.self, forKey: .apiUrl)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.apiKey, forKey: .apiKey)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.apiUrl, forKey: .apiUrl)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case apiKey
        case name
        case apiUrl
    }
}