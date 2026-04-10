import Foundation

/// This is the type of the message. "assistant.started" is sent when the assistant is started.
public enum ClientMessageAssistantStartedType: String, Codable, Hashable, CaseIterable, Sendable {
    case assistantStarted = "assistant.started"
}