import Foundation

/// Registration settings used when the SIP trunk requires SIP REGISTER.
public struct SipTrunkOutboundSipRegisterPlan: Codable, Hashable, Sendable {
    /// SIP registrar domain used for registration.
    public let domain: String?
    /// Username sent with the SIP REGISTER request.
    public let username: String?
    /// Authentication realm used for SIP registration.
    public let realm: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        domain: String? = nil,
        username: String? = nil,
        realm: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.domain = domain
        self.username = username
        self.realm = realm
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.domain = try container.decodeIfPresent(String.self, forKey: .domain)
        self.username = try container.decodeIfPresent(String.self, forKey: .username)
        self.realm = try container.decodeIfPresent(String.self, forKey: .realm)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.domain, forKey: .domain)
        try container.encodeIfPresent(self.username, forKey: .username)
        try container.encodeIfPresent(self.realm, forKey: .realm)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case domain
        case username
        case realm
    }
}