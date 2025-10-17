import Foundation

/// This is the HMAC algorithm to use for signing.
public enum HmacAuthenticationPlanAlgorithm: String, Codable, Hashable, CaseIterable, Sendable {
    case sha256
    case sha512
    case sha1
}