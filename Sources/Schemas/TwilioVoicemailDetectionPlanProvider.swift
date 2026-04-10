import Foundation

/// This is the provider to use for voicemail detection.
public enum TwilioVoicemailDetectionPlanProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case twilio
}