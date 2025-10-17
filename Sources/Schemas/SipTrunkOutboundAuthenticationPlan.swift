import Foundation

public struct SipTrunkOutboundAuthenticationPlan: Codable, Hashable, Sendable {
    /// This is not returned in the API.
    public let authPassword: String?
    public let authUsername: String?
    /// This can be used to configure if SIP register is required by the SIP trunk. If not provided, no SIP registration will be attempted.
    public let sipRegisterPlan: SipTrunkOutboundSipRegisterPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        authPassword: String? = nil,
        authUsername: String? = nil,
        sipRegisterPlan: SipTrunkOutboundSipRegisterPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.authPassword = authPassword
        self.authUsername = authUsername
        self.sipRegisterPlan = sipRegisterPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.authPassword = try container.decodeIfPresent(String.self, forKey: .authPassword)
        self.authUsername = try container.decodeIfPresent(String.self, forKey: .authUsername)
        self.sipRegisterPlan = try container.decodeIfPresent(SipTrunkOutboundSipRegisterPlan.self, forKey: .sipRegisterPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.authPassword, forKey: .authPassword)
        try container.encodeIfPresent(self.authUsername, forKey: .authUsername)
        try container.encodeIfPresent(self.sipRegisterPlan, forKey: .sipRegisterPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case authPassword
        case authUsername
        case sipRegisterPlan
    }
}