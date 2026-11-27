import Foundation

/// The xAI speech-to-text model to use. xAI currently exposes a single STT model — placeholder for future model selection.
public enum FallbackXaiTranscriberModel: String, Codable, Hashable, CaseIterable, Sendable {
    case `default`
}