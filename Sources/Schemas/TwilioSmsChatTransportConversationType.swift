import Foundation

/// This is the conversation type of the call (ie, voice or chat).
public enum TwilioSmsChatTransportConversationType: String, Codable, Hashable, CaseIterable, Sendable {
    case chat
}