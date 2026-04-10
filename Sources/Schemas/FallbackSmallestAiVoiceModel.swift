import Foundation

/// Smallest AI voice model to use. Defaults to 'lightning' when not specified.
public enum FallbackSmallestAiVoiceModel: String, Codable, Hashable, CaseIterable, Sendable {
    case lightning
}