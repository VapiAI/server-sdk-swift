import Foundation

/// This is the model that will be used.
public enum FallbackWellSaidVoiceModel: String, Codable, Hashable, CaseIterable, Sendable {
    case caruso
    case legacy
}