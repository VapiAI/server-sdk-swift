import Foundation

/// This is the model that will be used for the transcription.
public enum FallbackGoogleTranscriberModel: String, Codable, Hashable, CaseIterable, Sendable {
    case gemini25Pro = "gemini-2.5-pro"
    case gemini25Flash = "gemini-2.5-flash"
    case gemini25FlashLite = "gemini-2.5-flash-lite"
    case gemini20FlashThinkingExp = "gemini-2.0-flash-thinking-exp"
    case gemini20ProExp0205 = "gemini-2.0-pro-exp-02-05"
    case gemini20Flash = "gemini-2.0-flash"
    case gemini20FlashLite = "gemini-2.0-flash-lite"
    case gemini20FlashExp = "gemini-2.0-flash-exp"
    case gemini20FlashRealtimeExp = "gemini-2.0-flash-realtime-exp"
    case gemini15Flash = "gemini-1.5-flash"
    case gemini15Flash002 = "gemini-1.5-flash-002"
    case gemini15Pro = "gemini-1.5-pro"
    case gemini15Pro002 = "gemini-1.5-pro-002"
    case gemini10Pro = "gemini-1.0-pro"
}