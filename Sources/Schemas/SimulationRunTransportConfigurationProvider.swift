import Foundation

/// Transport provider for the simulation run
public enum SimulationRunTransportConfigurationProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case vapiWebsocket = "vapi.websocket"
    case vapiWebchat = "vapi.webchat"
}