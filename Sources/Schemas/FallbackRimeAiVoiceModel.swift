import Foundation

/// This is the model that will be used. Defaults to 'arcana' when not specified.
public enum FallbackRimeAiVoiceModel: String, Codable, Hashable, CaseIterable, Sendable {
    case arcana
    case mistv2
    case mist
}