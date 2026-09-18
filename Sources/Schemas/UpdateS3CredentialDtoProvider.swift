import Foundation

/// Credential provider. Only allowed value is s3
public enum UpdateS3CredentialDtoProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case s3
}