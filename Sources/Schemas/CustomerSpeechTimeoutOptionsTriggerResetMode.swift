import Foundation

/// Controls whether the hook's trigger counter resets after the customer speaks. Defaults to `never`.
public enum CustomerSpeechTimeoutOptionsTriggerResetMode: String, Codable, Hashable, CaseIterable, Sendable {
    case onUserSpeech
    case never
}