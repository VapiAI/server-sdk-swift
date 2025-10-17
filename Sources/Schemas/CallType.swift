import Foundation

/// This is the type of call.
public enum CallType: String, Codable, Hashable, CaseIterable, Sendable {
    case inboundPhoneCall
    case outboundPhoneCall
    case webCall
    case vapiWebsocketCall = "vapi.websocketCall"
}