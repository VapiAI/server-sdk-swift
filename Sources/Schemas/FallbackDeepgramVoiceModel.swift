import Foundation

/// This is the model that will be used. Defaults to 'aura' when not specified.
public enum FallbackDeepgramVoiceModel: String, Codable, Hashable, CaseIterable, Sendable {
    case aura
    case aura2 = "aura-2"
    case flux
}