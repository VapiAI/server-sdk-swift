import Foundation

/// The Reson8 speech-to-text endpoint to use. `turns` is Reson8's turn-detection endpoint.
public enum Reson8TranscriberModel: String, Codable, Hashable, CaseIterable, Sendable {
    case turns
}