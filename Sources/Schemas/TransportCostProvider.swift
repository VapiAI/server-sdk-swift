import Foundation

public enum TransportCostProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case daily
    case vapiWebsocket = "vapi.websocket"
    case twilio
    case vonage
    case telnyx
    case vapiSip = "vapi.sip"
}