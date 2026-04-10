import Foundation

/// This is the type of the message. "handoff-destination-request" is sent when the model is requesting handoff but destination is unknown.
public enum ServerMessageHandoffDestinationRequestType: String, Codable, Hashable, CaseIterable, Sendable {
    case handoffDestinationRequest = "handoff-destination-request"
}