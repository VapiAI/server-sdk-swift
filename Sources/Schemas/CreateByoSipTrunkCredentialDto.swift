import Foundation

public struct CreateByoSipTrunkCredentialDto: Codable, Hashable, Sendable {
    /// This is the list of SIP trunk's gateways.
    public let gateways: [SipTrunkGateway]
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
    /// This is the name of credential. This is just for your reference.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        gateways: [SipTrunkGateway],
        outboundAuthenticationPlan: SipTrunkOutboundAuthenticationPlan? = nil,
        outboundLeadingPlusEnabled: Bool? = nil,
        techPrefix: String? = nil,
        sipDiversionHeader: String? = nil,
        sbcConfiguration: SbcConfiguration? = nil,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.gateways = gateways
        self.outboundAuthenticationPlan = outboundAuthenticationPlan
        self.outboundLeadingPlusEnabled = outboundLeadingPlusEnabled
        self.techPrefix = techPrefix
        self.sipDiversionHeader = sipDiversionHeader
        self.sbcConfiguration = sbcConfiguration
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.gateways = try container.decode([SipTrunkGateway].self, forKey: .gateways)
        self.outboundAuthenticationPlan = try container.decodeIfPresent(SipTrunkOutboundAuthenticationPlan.self, forKey: .outboundAuthenticationPlan)
        self.outboundLeadingPlusEnabled = try container.decodeIfPresent(Bool.self, forKey: .outboundLeadingPlusEnabled)
        self.techPrefix = try container.decodeIfPresent(String.self, forKey: .techPrefix)
        self.sipDiversionHeader = try container.decodeIfPresent(String.self, forKey: .sipDiversionHeader)
        self.sbcConfiguration = try container.decodeIfPresent(SbcConfiguration.self, forKey: .sbcConfiguration)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.gateways, forKey: .gateways)
        try container.encodeIfPresent(self.outboundAuthenticationPlan, forKey: .outboundAuthenticationPlan)
        try container.encodeIfPresent(self.outboundLeadingPlusEnabled, forKey: .outboundLeadingPlusEnabled)
        try container.encodeIfPresent(self.techPrefix, forKey: .techPrefix)
        try container.encodeIfPresent(self.sipDiversionHeader, forKey: .sipDiversionHeader)
        try container.encodeIfPresent(self.sbcConfiguration, forKey: .sbcConfiguration)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case gateways
        case outboundAuthenticationPlan
        case outboundLeadingPlusEnabled
        case techPrefix
        case sipDiversionHeader
        case sbcConfiguration
        case name
    }
}