import Foundation

public struct UpdateByoSipTrunkCredentialDto: Codable, Hashable, Sendable {
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// This is the list of SIP trunk's gateways.
    public let gateways: [SipTrunkGateway]?
    /// This can be used to configure the outbound authentication if required by the SIP trunk.
    public let outboundAuthenticationPlan: SipTrunkOutboundAuthenticationPlan?
    /// This ensures the outbound origination attempts have a leading plus. Defaults to false to match conventional telecom behavior.
    /// 
    /// Usage:
    /// - Vonage/Twilio requires leading plus for all outbound calls. Set this to true.
    /// 
    /// @default false
    public let outboundLeadingPlusEnabled: Bool?
    /// This can be used to configure the tech prefix on outbound calls. This is an advanced property.
    public let techPrefix: String?
    /// This can be used to enable the SIP diversion header for authenticating the calling number if the SIP trunk supports it. This is an advanced property.
    public let sipDiversionHeader: String?
    /// This is an advanced configuration for enterprise deployments. This uses the onprem SBC to trunk into the SIP trunk's `gateways`, rather than the managed SBC provided by Vapi.
    public let sbcConfiguration: SbcConfiguration?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String? = nil,
        gateways: [SipTrunkGateway]? = nil,
        outboundAuthenticationPlan: SipTrunkOutboundAuthenticationPlan? = nil,
        outboundLeadingPlusEnabled: Bool? = nil,
        techPrefix: String? = nil,
        sipDiversionHeader: String? = nil,
        sbcConfiguration: SbcConfiguration? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.gateways = gateways
        self.outboundAuthenticationPlan = outboundAuthenticationPlan
        self.outboundLeadingPlusEnabled = outboundLeadingPlusEnabled
        self.techPrefix = techPrefix
        self.sipDiversionHeader = sipDiversionHeader
        self.sbcConfiguration = sbcConfiguration
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.gateways = try container.decodeIfPresent([SipTrunkGateway].self, forKey: .gateways)
        self.outboundAuthenticationPlan = try container.decodeIfPresent(SipTrunkOutboundAuthenticationPlan.self, forKey: .outboundAuthenticationPlan)
        self.outboundLeadingPlusEnabled = try container.decodeIfPresent(Bool.self, forKey: .outboundLeadingPlusEnabled)
        self.techPrefix = try container.decodeIfPresent(String.self, forKey: .techPrefix)
        self.sipDiversionHeader = try container.decodeIfPresent(String.self, forKey: .sipDiversionHeader)
        self.sbcConfiguration = try container.decodeIfPresent(SbcConfiguration.self, forKey: .sbcConfiguration)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.gateways, forKey: .gateways)
        try container.encodeIfPresent(self.outboundAuthenticationPlan, forKey: .outboundAuthenticationPlan)
        try container.encodeIfPresent(self.outboundLeadingPlusEnabled, forKey: .outboundLeadingPlusEnabled)
        try container.encodeIfPresent(self.techPrefix, forKey: .techPrefix)
        try container.encodeIfPresent(self.sipDiversionHeader, forKey: .sipDiversionHeader)
        try container.encodeIfPresent(self.sbcConfiguration, forKey: .sbcConfiguration)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case gateways
        case outboundAuthenticationPlan
        case outboundLeadingPlusEnabled
        case techPrefix
        case sipDiversionHeader
        case sbcConfiguration
    }
}