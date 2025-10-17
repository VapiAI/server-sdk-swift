import Foundation

public enum CredentialWebhookDtoAuthMode: String, Codable, Hashable, CaseIterable, Sendable {
    case oauth2 = "OAUTH2"
    case apiKey = "API_KEY"
    case basic = "BASIC"
}