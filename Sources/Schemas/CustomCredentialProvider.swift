import Foundation

public enum CustomCredentialProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case customCredential = "custom-credential"
}