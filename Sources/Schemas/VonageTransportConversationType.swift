import Foundation

/// This is the conversation type of the call (ie, voice or chat).
public enum VonageTransportConversationType: String, Codable, Hashable, CaseIterable, Sendable {
    case voice
}