import Foundation

/// This is the provider to use for voicemail detection.
public enum GoogleVoicemailDetectionPlanProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case google
}