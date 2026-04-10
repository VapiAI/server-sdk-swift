import Foundation

/// Credential provider. Only allowed value is cloudflare
public enum CloudflareCredentialProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case cloudflare
}