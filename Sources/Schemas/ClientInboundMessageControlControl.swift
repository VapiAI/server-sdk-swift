import Foundation

/// This is the control action
public enum ClientInboundMessageControlControl: String, Codable, Hashable, CaseIterable, Sendable {
    case muteAssistant = "mute-assistant"
    case unmuteAssistant = "unmute-assistant"
    case muteCustomer = "mute-customer"
    case unmuteCustomer = "unmute-customer"
    case sayFirstMessage = "say-first-message"
}