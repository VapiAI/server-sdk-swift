import Foundation

/// Credential provider. Only allowed value is cloudflare
public enum UpdateCloudflareCredentialDtoProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case cloudflare
}