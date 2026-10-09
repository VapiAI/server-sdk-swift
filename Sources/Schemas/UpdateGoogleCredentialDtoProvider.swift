import Foundation

/// This is the key for Gemini in Google AI Studio. Get it from here: https://aistudio.google.com/app/apikey
public enum UpdateGoogleCredentialDtoProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case google
}