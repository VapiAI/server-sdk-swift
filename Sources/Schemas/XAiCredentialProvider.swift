import Foundation

/// This is the api key for Grok in XAi's console. Get it from here: https://console.x.ai
public enum XAiCredentialProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case xai
}