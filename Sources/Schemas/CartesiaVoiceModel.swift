import Foundation

/// This is the model that will be used. This is optional and will default to the correct model for the voiceId.
public enum CartesiaVoiceModel: String, Codable, Hashable, CaseIterable, Sendable {
    case sonic2 = "sonic-2"
    case sonicEnglish = "sonic-english"
    case sonicMultilingual = "sonic-multilingual"
    case sonicPreview = "sonic-preview"
    case sonic
}