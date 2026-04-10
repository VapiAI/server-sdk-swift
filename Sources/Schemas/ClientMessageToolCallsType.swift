import Foundation

/// This is the type of the message. "tool-calls" is sent to call a tool.
public enum ClientMessageToolCallsType: String, Codable, Hashable, CaseIterable, Sendable {
    case toolCalls = "tool-calls"
}