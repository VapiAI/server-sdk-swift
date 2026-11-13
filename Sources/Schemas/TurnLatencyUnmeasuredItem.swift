import Foundation

public enum TurnLatencyUnmeasuredItem: String, Codable, Hashable, CaseIterable, Sendable {
    case transcriber
    case endpointing
    case model
    case voice
}