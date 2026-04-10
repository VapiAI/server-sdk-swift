import Foundation

/// Credential provider. Only allowed value is s3
public enum S3CredentialProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case s3
}