import Foundation

/// The encoding format for the signature. Defaults to 'hex'.
public enum HmacAuthenticationPlanSignatureEncoding: String, Codable, Hashable, CaseIterable, Sendable {
    case hex
    case base64
}