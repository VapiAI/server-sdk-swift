import Foundation

/// The status of the relay request
public enum RelayResponseStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case deliveredLive
    case deliveredHeadless
    case failed
}