import Foundation

/// This is the transport of the phone call.
/// 
/// Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
public enum CallPhoneCallTransport: String, Codable, Hashable, CaseIterable, Sendable {
    case sip
    case pstn
}