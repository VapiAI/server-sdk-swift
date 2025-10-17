import Foundation

/// This is the model that will be used. Defaults to 'aura-2' when not specified.
public enum DeepgramVoiceModel: String, Codable, Hashable, CaseIterable, Sendable {
    case aura
    case aura2 = "aura-2"
}