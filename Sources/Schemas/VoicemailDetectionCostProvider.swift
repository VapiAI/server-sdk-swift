import Foundation

/// This is the provider that was used to detect the voicemail.
public enum VoicemailDetectionCostProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case twilio
    case google
    case openai
    case vapi
}