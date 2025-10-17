import Foundation

public enum CredentialWebhookDtoOperation: String, Codable, Hashable, CaseIterable, Sendable {
    case creation
    case override
    case refresh
}