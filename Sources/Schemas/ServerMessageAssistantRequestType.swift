import Foundation

/// This is the type of the message. "assistant-request" is sent to fetch assistant configuration for an incoming call.
public enum ServerMessageAssistantRequestType: String, Codable, Hashable, CaseIterable, Sendable {
    case assistantRequest = "assistant-request"
}