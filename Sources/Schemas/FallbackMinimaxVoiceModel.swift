import Foundation

/// This is the model that will be used. Options are 'speech-02-hd' and 'speech-02-turbo'.
/// speech-02-hd is optimized for high-fidelity applications like voiceovers and audiobooks.
/// speech-02-turbo is designed for real-time applications with low latency.
/// 
/// @default "speech-02-turbo"
public enum FallbackMinimaxVoiceModel: String, Codable, Hashable, CaseIterable, Sendable {
    case speech02Hd = "speech-02-hd"
    case speech02Turbo = "speech-02-turbo"
    case speech25TurboPreview = "speech-2.5-turbo-preview"
}