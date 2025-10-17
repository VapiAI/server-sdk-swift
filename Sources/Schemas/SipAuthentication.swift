import Foundation

public struct SipAuthentication: Codable, Hashable, Sendable {
    /// This will be expected in the `realm` field of the `authorization` header of the SIP INVITE. Defaults to sip.vapi.ai.
    public let realm: String?
    /// This will be expected in the `username` field of the `authorization` header of the SIP INVITE.
    public let username: String
    /// This will be expected to generate the `response` field of the `authorization` header of the SIP INVITE, through digest authentication.
    public let password: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        realm: String? = nil,
        username: String,
        password: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.realm = realm
        self.username = username
        self.password = password
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.realm = try container.decodeIfPresent(String.self, forKey: .realm)
        self.username = try container.decode(String.self, forKey: .username)
        self.password = try container.decode(String.self, forKey: .password)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.realm, forKey: .realm)
        try container.encode(self.username, forKey: .username)
        try container.encode(self.password, forKey: .password)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case realm
        case username
        case password
    }
}