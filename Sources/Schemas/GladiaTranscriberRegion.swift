import Foundation

/// Region for processing audio (us-west or eu-west)
public enum GladiaTranscriberRegion: String, Codable, Hashable, CaseIterable, Sendable {
    case usWest = "us-west"
    case euWest = "eu-west"
}