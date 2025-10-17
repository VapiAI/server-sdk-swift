import Foundation

/// This is the provider of the call.
/// 
/// Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
public enum CallPhoneCallProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case twilio
    case vonage
    case vapi
    case telnyx
}