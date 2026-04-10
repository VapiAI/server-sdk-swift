import Foundation

/// This is the model that will be used. This is optional and will default to the correct model for the voiceId.
public enum FallbackCartesiaVoiceModel: String, Codable, Hashable, CaseIterable, Sendable {
    case sonic3 = "sonic-3"
    case sonic320260112 = "sonic-3-2026-01-12"
    case sonic320251027 = "sonic-3-2025-10-27"
    case sonic2 = "sonic-2"
    case sonic220250611 = "sonic-2-2025-06-11"
    case sonicEnglish = "sonic-english"
    case sonicMultilingual = "sonic-multilingual"
    case sonicPreview = "sonic-preview"
    case sonic
}