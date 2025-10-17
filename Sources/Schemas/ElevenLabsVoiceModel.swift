import Foundation

/// This is the model that will be used. Defaults to 'eleven_turbo_v2' if not specified.
public enum ElevenLabsVoiceModel: String, Codable, Hashable, CaseIterable, Sendable {
    case elevenMultilingualV2 = "eleven_multilingual_v2"
    case elevenTurboV2 = "eleven_turbo_v2"
    case elevenTurboV25 = "eleven_turbo_v2_5"
    case elevenFlashV2 = "eleven_flash_v2"
    case elevenFlashV25 = "eleven_flash_v2_5"
    case elevenMonolingualV1 = "eleven_monolingual_v1"
}