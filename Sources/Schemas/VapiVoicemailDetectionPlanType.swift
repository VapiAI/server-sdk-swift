import Foundation

/// This is the detection type to use for voicemail detection.
/// - 'audio': Uses native audio models (default)
/// - 'transcript': Uses ASR/transcript-based detection
/// @default 'audio' (audio detection)
public enum VapiVoicemailDetectionPlanType: String, Codable, Hashable, CaseIterable, Sendable {
    case audio
    case transcript
}