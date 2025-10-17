import Foundation

/// This is the request to control the phone call.
public enum ServerMessagePhoneCallControlRequest: String, Codable, Hashable, CaseIterable, Sendable {
    case forward
    case hangUp = "hang-up"
}