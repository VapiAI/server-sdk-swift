import Foundation

/// This is for S3-compatible storage such as MinIO, Garage, Ceph, or Backblaze B2.
public enum UpdateS3CompatibleCredentialDtoProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case s3Compatible = "s3-compatible"
}