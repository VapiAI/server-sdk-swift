import Foundation

public enum CredentialWebhookDtoType: String, Codable, Hashable, CaseIterable, Sendable {
    case auth
    case sync
    case forward
}