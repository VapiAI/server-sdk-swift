import Foundation

public struct UpdateTwilioCredentialDto: Codable, Hashable, Sendable {
    public let provider: UpdateTwilioCredentialDtoProvider?
    /// This is not returned in the API.
    public let authToken: String?
    /// This is not returned in the API.
    public let apiKey: String?
    /// This is not returned in the API.
    public let apiSecret: String?
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    public let accountSid: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: UpdateTwilioCredentialDtoProvider? = nil,
        authToken: String? = nil,
        apiKey: String? = nil,
        apiSecret: String? = nil,
        name: String? = nil,
        accountSid: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.authToken = authToken
        self.apiKey = apiKey
        self.apiSecret = apiSecret
        self.name = name
        self.accountSid = accountSid
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decodeIfPresent(UpdateTwilioCredentialDtoProvider.self, forKey: .provider)
        self.authToken = try container.decodeIfPresent(String.self, forKey: .authToken)
        self.apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
        self.apiSecret = try container.decodeIfPresent(String.self, forKey: .apiSecret)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.accountSid = try container.decodeIfPresent(String.self, forKey: .accountSid)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.authToken, forKey: .authToken)
        try container.encodeIfPresent(self.apiKey, forKey: .apiKey)
        try container.encodeIfPresent(self.apiSecret, forKey: .apiSecret)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.accountSid, forKey: .accountSid)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case authToken
        case apiKey
        case apiSecret
        case name
        case accountSid
    }
}