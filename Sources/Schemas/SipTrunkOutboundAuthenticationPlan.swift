import Foundation

/// Credentials and optional SIP REGISTER settings used to authenticate outbound calls with a SIP trunk.
public struct SipTrunkOutboundAuthenticationPlan: Codable, Hashable, Sendable {
    /// This is not returned in the API.
    public let authPassword: String?
    /// This can be used to configure if SIP register is required by the SIP trunk. On creation, omission disables registration. On update, omission preserves it; null disables it.
    public let sipRegisterPlan: Nullable<SipTrunkOutboundSipRegisterPlan>?
    /// Username used to authenticate outbound SIP requests.
    public let authUsername: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        authPassword: String? = nil,
        sipRegisterPlan: Nullable<SipTrunkOutboundSipRegisterPlan>? = nil,
        authUsername: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.authPassword = authPassword
        self.sipRegisterPlan = sipRegisterPlan
        self.authUsername = authUsername
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.authPassword = try container.decodeIfPresent(String.self, forKey: .authPassword)
        self.sipRegisterPlan = try container.decodeNullableIfPresent(SipTrunkOutboundSipRegisterPlan.self, forKey: .sipRegisterPlan)
        self.authUsername = try container.decodeIfPresent(String.self, forKey: .authUsername)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.authPassword, forKey: .authPassword)
        try container.encodeNullableIfPresent(self.sipRegisterPlan, forKey: .sipRegisterPlan)
        try container.encodeIfPresent(self.authUsername, forKey: .authUsername)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case authPassword
        case sipRegisterPlan
        case authUsername
    }
}