import Foundation

/// This is the type of the message. "user-interrupted" is sent when the user interrupts the assistant.
public enum ClientMessageUserInterruptedType: String, Codable, Hashable, CaseIterable, Sendable {
    case userInterrupted = "user-interrupted"
}