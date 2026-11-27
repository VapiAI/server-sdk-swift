import Foundation

/// Machine-readable reason for the warning.
public enum AssistantFallbackWarningCode: String, Codable, Hashable, CaseIterable, Sendable {
    case fallbackVoicesEmpty = "fallback-voices-empty"
    case fallbackVoiceSameProvider = "fallback-voice-same-provider"
    case fallbackVoiceLanguageUnsupported = "fallback-voice-language-unsupported"
    case fallbackVoiceInvalid = "fallback-voice-invalid"
    case fallbackTranscribersEmpty = "fallback-transcribers-empty"
    case fallbackTranscriberSameProvider = "fallback-transcriber-same-provider"
    case fallbackTranscriberLanguageUnsupported = "fallback-transcriber-language-unsupported"
}