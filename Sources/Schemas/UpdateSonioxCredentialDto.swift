import Foundation

public struct UpdateSonioxCredentialDto: Codable, Hashable, Sendable {
    public let provider: UpdateSonioxCredentialDtoProvider?
    /// This is not returned in the API.
    public let apiKey: String?
    /// Custom Soniox WebSocket endpoint (e.g. EU server wss://stt-rt.eu.soniox.com/transcribe-websocket). Defaults to the region-appropriate endpoint when omitted.
    public let apiUrl: String?
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: UpdateSonioxCredentialDtoProvider? = nil,
        apiKey: String? = nil,
        apiUrl: String? = nil,
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
        self.provider = try container.decodeIfPresent(UpdateSonioxCredentialDtoProvider.self, forKey: .provider)
        self.apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
        self.apiUrl = try container.decodeIfPresent(String.self, forKey: .apiUrl)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.apiKey, forKey: .apiKey)
        try container.encodeIfPresent(self.apiUrl, forKey: .apiUrl)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case apiKey
        case apiUrl
        case name
    }
}