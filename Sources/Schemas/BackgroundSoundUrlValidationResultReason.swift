import Foundation

/// Why validation failed. Only present when valid is false.
public enum BackgroundSoundUrlValidationResultReason: String, Codable, Hashable, CaseIterable, Sendable {
    case invalidUrl = "invalid-url"
    case blockedAddress = "blocked-address"
    case unreachable
    case timeout
    case tooManyRedirects = "too-many-redirects"
    case httpError = "http-error"
    case notAudio = "not-audio"
}