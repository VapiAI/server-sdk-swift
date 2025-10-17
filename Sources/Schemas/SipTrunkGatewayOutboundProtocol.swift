import Foundation

/// This is the protocol to use for SIP signaling outbound calls. Default is udp.
/// 
/// @default udp
public enum SipTrunkGatewayOutboundProtocol: String, Codable, Hashable, CaseIterable, Sendable {
    case tlsSrtp = "tls/srtp"
    case tcp
    case tls
    case udp
}