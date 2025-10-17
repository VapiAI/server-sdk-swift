import Foundation

public struct SipTrunkGateway: Codable, Hashable, Sendable {
    /// This is the address of the gateway. It can be an IPv4 address like 1.1.1.1 or a fully qualified domain name like my-sip-trunk.pstn.twilio.com.
    public let ip: String
    /// This is the port number of the gateway. Default is 5060.
    /// 
    /// @default 5060
    public let port: Double?
    /// This is the netmask of the gateway. Defaults to 32.
    /// 
    /// @default 32
    public let netmask: Double?
    /// This is whether inbound calls are allowed from this gateway. Default is true.
    /// 
    /// @default true
    public let inboundEnabled: Bool?
    /// This is whether outbound calls should be sent to this gateway. Default is true.
    /// 
    /// Note, if netmask is less than 32, it doesn't affect the outbound IPs that are tried. 1 attempt is made to `ip:port`.
    /// 
    /// @default true
    public let outboundEnabled: Bool?
    /// This is the protocol to use for SIP signaling outbound calls. Default is udp.
    /// 
    /// @default udp
    public let outboundProtocol: SipTrunkGatewayOutboundProtocol?
    /// This is whether to send options ping to the gateway. This can be used to check if the gateway is reachable. Default is false.
    /// 
    /// This is useful for high availability setups where you want to check if the gateway is reachable before routing calls to it. Note, if no gateway for a trunk is reachable, outbound calls will be rejected.
    /// 
    /// @default false
    public let optionsPingEnabled: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        ip: String,
        port: Double? = nil,
        netmask: Double? = nil,
        inboundEnabled: Bool? = nil,
        outboundEnabled: Bool? = nil,
        outboundProtocol: SipTrunkGatewayOutboundProtocol? = nil,
        optionsPingEnabled: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.ip = ip
        self.port = port
        self.netmask = netmask
        self.inboundEnabled = inboundEnabled
        self.outboundEnabled = outboundEnabled
        self.outboundProtocol = outboundProtocol
        self.optionsPingEnabled = optionsPingEnabled
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ip = try container.decode(String.self, forKey: .ip)
        self.port = try container.decodeIfPresent(Double.self, forKey: .port)
        self.netmask = try container.decodeIfPresent(Double.self, forKey: .netmask)
        self.inboundEnabled = try container.decodeIfPresent(Bool.self, forKey: .inboundEnabled)
        self.outboundEnabled = try container.decodeIfPresent(Bool.self, forKey: .outboundEnabled)
        self.outboundProtocol = try container.decodeIfPresent(SipTrunkGatewayOutboundProtocol.self, forKey: .outboundProtocol)
        self.optionsPingEnabled = try container.decodeIfPresent(Bool.self, forKey: .optionsPingEnabled)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.ip, forKey: .ip)
        try container.encodeIfPresent(self.port, forKey: .port)
        try container.encodeIfPresent(self.netmask, forKey: .netmask)
        try container.encodeIfPresent(self.inboundEnabled, forKey: .inboundEnabled)
        try container.encodeIfPresent(self.outboundEnabled, forKey: .outboundEnabled)
        try container.encodeIfPresent(self.outboundProtocol, forKey: .outboundProtocol)
        try container.encodeIfPresent(self.optionsPingEnabled, forKey: .optionsPingEnabled)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case ip
        case port
        case netmask
        case inboundEnabled
        case outboundEnabled
        case outboundProtocol
        case optionsPingEnabled
    }
}