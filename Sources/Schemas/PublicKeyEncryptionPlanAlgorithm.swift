import Foundation

/// The encryption algorithm to use.
public enum PublicKeyEncryptionPlanAlgorithm: String, Codable, Hashable, CaseIterable, Sendable {
    case rsaOaep256 = "RSA-OAEP-256"
}