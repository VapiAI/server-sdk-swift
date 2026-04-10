import Foundation

/// This is the provider to use for voicemail detection.
public enum OpenAiVoicemailDetectionPlanProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case openai
}