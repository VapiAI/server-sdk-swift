import Foundation

/// This is the type of the message. "tool-calls-result" is sent to forward the result of a tool call to the client.
public enum ClientMessageToolCallsResultType: String, Codable, Hashable, CaseIterable, Sendable {
    case toolCallsResult = "tool-calls-result"
}