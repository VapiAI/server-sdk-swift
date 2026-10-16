import Foundation

/// Telephony or transport provider that generated the cost.
public enum TransportCostProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case daily
    case vapiWebsocket = "vapi.websocket"
    case twilio
    case vonage
    case telnyx
    case vapiSip = "vapi.sip"
}